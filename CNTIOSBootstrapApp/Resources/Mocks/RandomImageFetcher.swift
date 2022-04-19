//
//  RandomImageFetcher.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/19/22.
//

import Combine
import Foundation

class RandomImageFetcher: APIRepository {
    static let shared = RandomImageFetcher()

    private var subscriptions = Set<AnyCancellable>()

    func start() {
        let publisher = RandomImageFetcher.shared
            .request(api: RandomImageRequest.imageBy1000)

        publisher
            .map({ response in
                switch response {
                case .success(let data):
                    if let image = data as? RandomImage {
                        return image.message
                    }
                default: break
                }

                return nil
            })
            .replaceNil(with: "unknown")
            .sink(receiveCompletion: { c in
                print("completion: ", c)
            }, receiveValue: { result in
                print("result: ", result)
            })
            .store(in: &subscriptions)
    }
}

