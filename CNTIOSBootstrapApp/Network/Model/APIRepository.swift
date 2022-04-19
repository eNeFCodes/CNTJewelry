//
//  APIRepository.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Alamofire
import Combine

class APIRepository: APIRepositoryProtocol {

    static let NetworkRequestQueue = DispatchQueue(label: "com.CNTIOSBootstrapApp.NetworkRequestQueue",
                                                   qos: .background,
                                                   attributes: .concurrent,
                                                   autoreleaseFrequency: .workItem,
                                                   target: .global())

    static let NetworkRequestCompletionQueue = DispatchQueue(label: "com.CNTIOSBootstrapApp.NetworkRequestCompletionQueue",
                                                             qos: .userInteractive,
                                                             attributes: .concurrent,
                                                             autoreleaseFrequency: .workItem,
                                                             target: .global())

    func request<Request>(api: Request) -> AnyPublisher<APIResponse, Never> where Request: APIRequestProtocol {
        let publisher = PassthroughSubject<APIResponse, Never>()

        // check internet and send internet error

        AF.request(api.fullURL,
                   method: api.method,
                   parameters: api.parameters,
                   encoding: api.encoding,
                   headers: api.headers,
                   interceptor: api.interceptor,
                   requestModifier: api.requestModifier)
            .response(queue: APIRepository.NetworkRequestQueue) { [weak self] response in
                guard let self = self else { return }
                guard let data = response.data else {
                    APIRepository.NetworkRequestCompletionQueue.async {
                        if let error = response.error {
                            publisher.send(.error(error: .error(error: error)))
                        } else {
                            publisher.send(.error(error: .unknown))
                        }
                        publisher.send(completion: .finished)
                    }
                    return
                }

                self.processResponse(api: api, publisher: publisher, data: data)
            }

        return publisher.eraseToAnyPublisher()
    }

    func processResponse<API>(api: API, publisher: PassthroughSubject<APIResponse, Never>, data: Data) where API : APIRequestProtocol {
        // override this from subclasses
    }

    func processErrorAndSuccessOnlyResponse(publisher: PassthroughSubject<APIResponse, Never>, data: Data) {
        if let error = try? JSONDecoder().decode(APIResponseError.self, from: data) {
            publisher.send(.error(error: .responseError(error: error)))
        } else {
            publisher.send(.error(error: .errorMessage(message: APIError.ErrorTypeConversionFailed)))
        }

        publisher.send(completion: .finished)
    }
}
