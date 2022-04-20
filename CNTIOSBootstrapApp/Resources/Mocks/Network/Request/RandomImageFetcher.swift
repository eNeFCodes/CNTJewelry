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
        RandomImageFetcher.shared
            .request(api: RandomImageRequest.imageBy1000)
            .sink(receiveCompletion: { c in
                print("completion: ", c)
            }, receiveValue: { result in
                switch result {
                case .success(let data):
                    if let image = data as? RandomImage {
                        print("message: ", image.message)
                    }
                default: break
                }
            })
            .store(in: &subscriptions)
    }

    func startMultiple() {
        RandomImageFetcher.shared
            .request(apis: [RandomImageRequest.imageBy2000, RandomImageRequest.imageBy3000])
            .sink(receiveCompletion: { c in
                print("multile completion: ", c)
            }, receiveValue: { result in
                switch result {
                case .success(let data):
                    if let image = data as? RandomImage {
                        print("multile message: ", image.message)
                    }
                default: break
                }
            })
            .store(in: &subscriptions)
    }
}

