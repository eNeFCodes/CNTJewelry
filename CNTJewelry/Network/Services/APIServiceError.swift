//
//  APIServiceError.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Alamofire

enum APIServiceError: Error {
    case responseError(error: APIResponseErrorProtocol)
    case errorMessage(message: String)
    case error(error: Error)
    case noInternetConnection
    case unknown

    var description: String {
        switch self {
        case .responseError(let error):
            return error.description
        case .errorMessage(let message):
            return message
        case .error(let error):
            return error.localizedDescription
        case .noInternetConnection:
            return "No Internet Connection"
        case .unknown:
            return "Unknown Error"
        }
    }
}

extension APIServiceError: Equatable {
    static func == (lhs: APIServiceError, rhs: APIServiceError) -> Bool {
        switch (lhs, rhs) {
        case (.responseError, .responseError):
            return true
        case (.errorMessage, .errorMessage):
            return true
        case (.error, .error):
            return true
        case (.noInternetConnection, .noInternetConnection):
            return true
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
}

extension APIServiceError {
    static let ErrorTypeConversionFailed = "Conversion failed"
}
