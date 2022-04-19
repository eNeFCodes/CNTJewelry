//
//  APIResponseProtocol.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Foundation

typealias APIResponseProtocol = Decodable

enum APIResponse {
    case success(data: APIResponseProtocol)
    case error(error: APIError)
}

protocol APIResponseErrorProtocol {
    var description: String { get }
}
