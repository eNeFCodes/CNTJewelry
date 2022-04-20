//
//  APIRepository.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Alamofire
import Combine
import Foundation

class APIRepository {

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
        // check internet and send internet error

        let publisher = PassthroughSubject<APIResponse, Never>()
        AF.request(api.fullURL,
                   method: api.method,
                   parameters: api.parameters,
                   encoding: api.encoding,
                   headers: api.headers,
                   interceptor: api.interceptor,
                   requestModifier: api.requestModifier)
            .response(queue: APIRepository.NetworkRequestQueue) { [weak self] response in
                guard let _ = self else { return }
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

                APIRepository.NetworkRequestCompletionQueue.async {
                    api.responseProcessor(api: api, publisher: publisher, data: data, shouldFinishImmediately: true)
                }
            }

        return publisher.eraseToAnyPublisher()
    }

    // use for multiple request instance - ignores request order
    func request<Request>(apis: [Request]) -> AnyPublisher<APIResponse, Never> where Request: APIRequestProtocol {
        // check internet and send internet error

        let group = DispatchGroup()
        let publisher = PassthroughSubject<APIResponse, Never>()

        for api in apis {
            group.enter() // send enter dispatch
            AF.request(api.fullURL,
                       method: api.method,
                       parameters: api.parameters,
                       encoding: api.encoding,
                       headers: api.headers,
                       interceptor: api.interceptor,
                       requestModifier: api.requestModifier)
                .response(queue: APIRepository.NetworkRequestQueue) { [weak self] response in
                    guard let _ = self else { return }
                    guard let data = response.data else {
                        APIRepository.NetworkRequestCompletionQueue.async {
                            if let error = response.error {
                                publisher.send(.error(error: .error(error: error)))
                            } else {
                                publisher.send(.error(error: .unknown))
                            }
                            group.leave() // send leave dispatch
                        }
                        return
                    }

                    APIRepository.NetworkRequestCompletionQueue.async {
                        api.responseProcessor(api: api, publisher: publisher, data: data, shouldFinishImmediately: false)
                        group.leave() // send leave dispatch
                    }
                }
        }

        group.notify(queue: APIRepository.NetworkRequestCompletionQueue) {
            publisher.send(completion: .finished)
        }

        return publisher.eraseToAnyPublisher()
    }
}

extension APIRepository {

    class func processErrorAndSuccessOnlyResponse(publisher: PassthroughSubject<APIResponse, Never>, data: Data, shouldFinishImmediately: Bool) {
        if let error = try? JSONDecoder().decode(APIResponseError.self, from: data) {
            publisher.send(.error(error: .responseError(error: error)))
        } else {
            publisher.send(.error(error: .errorMessage(message: APIError.ErrorTypeConversionFailed)))
        }

        if shouldFinishImmediately {
            publisher.send(completion: .finished)
        }
    }
}
