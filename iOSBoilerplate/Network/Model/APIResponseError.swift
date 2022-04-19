//
//  APIResponseError.swift
//  iOSBoilerplate
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Foundation

struct APIResponseError: APIResponseProtocol, APIResponseErrorProtocol {

    var description: String {
        return "\(self)"
    }
}
