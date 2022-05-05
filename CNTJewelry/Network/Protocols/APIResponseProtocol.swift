//
//  APIResponseProtocol.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Foundation

typealias APIResponseProtocol = Decodable

protocol APIResponseErrorProtocol {
    var description: String { get }
}

enum APIResponse {
    case success(data: APIResponseProtocol)
    case error(error: APIServiceError)
}
