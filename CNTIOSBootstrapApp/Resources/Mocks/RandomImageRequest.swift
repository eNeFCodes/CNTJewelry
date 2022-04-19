//
//  RandomImageRequest.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Alamofire
import Combine
import Foundation

enum RandomImageRequest {
    case imageBy1000
    case imageBy2000
}

extension RandomImageRequest: APIRequestProtocol {

    var baseURL: URL {
        URL(string: "https://picsum.photos")!
    }

    var path: String {
        switch self {
        case .imageBy1000:
            return "/1000"
        case .imageBy2000:
            return "/2000"
        }
    }

    var fullURL: URL {
        baseURL.appendingPathComponent(path)
    }

    var method: HTTPMethod {
        .get
    }

    var headers: HTTPHeaders? {
        nil
    }

    var queryParameters: Parameters? {
        nil
    }

    var parameters: Parameters? {
        nil
    }

    var encoding: ParameterEncoding {
        URLEncoding.default
    }

    var interceptor: RequestInterceptor? {
        nil
    }

    var requestModifier: Session.RequestModifier? {
        nil
    }
}

extension RandomImageRequest {

    func responseProcessor<API>(api: API, publisher: PassthroughSubject<APIResponse, Never>, data: Data, shouldFinishImmediately: Bool) where API : APIRequestProtocol {
        if let image = UIImage(data: data) {
            publisher.send(.success(data: RandomImage(message: "\(image)")))

            if shouldFinishImmediately {
                publisher.send(completion: .finished)
            }
        } else {
            APIRepository.processErrorAndSuccessOnlyResponse(publisher: publisher, data: data, shouldFinishImmediately: shouldFinishImmediately)
        }
    }
}
