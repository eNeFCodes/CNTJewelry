//
//  APIRepositoryProtocol.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Combine
import Foundation

protocol APIRepositoryProtocol {
    func responseProcessor<API: APIRequestProtocol>(api: API, publisher: PassthroughSubject<APIResponse, Never>, data: Data, shouldFinishImmediately: Bool)
}
