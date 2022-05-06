//
//  LoginPageOptionViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Foundation
import Combine

class LoginPageOptionViewModel: ObservableObject {
    struct Action: Identifiable {
        let id: Int
        let title: String
    }

    let actions: [Action]

    var publisher: PassthroughSubject<Int, Never>

    init(actions: [Action],
         publisher: PassthroughSubject<Int, Never> = PassthroughSubject<Int, Never>()) {
        self.actions = actions
        self.publisher = publisher
    }

    func triggerAction(with id: Int) {
        publisher.send(id)
    }
}
