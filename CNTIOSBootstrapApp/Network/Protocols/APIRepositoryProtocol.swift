//
//  APIRepositoryProtocol.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Combine
import Foundation

/** Processor format
 * func nameAPIRequest<API: APIProtocol>(api: API, observer: AnyObserver<APIResponse>, data: Data)
 */
protocol APIRepositoryProtocol {
    func processResponse<API: APIRequestProtocol>(api: API, publisher: PassthroughSubject<APIResponse, Never>, data: Data)
}
