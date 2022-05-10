//
//  LoginPageOptionViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Foundation
import Combine

class LoginPageOptionViewModel: ObservableObject {
    enum LoginOptionType {
        case atlasLogin
        case faceAndTouchID
    }

    struct Action: Identifiable {
        let id: Int
        let title: String
        let type: LoginOptionType
    }

    let actions: [Action]
    let publisher: PassthroughSubject<LoginOptionType, Never>

    init(actions: [Action],
         publisher: PassthroughSubject<LoginOptionType, Never> = PassthroughSubject<LoginOptionType, Never>()) {
        self.actions = actions
        self.publisher = publisher
    }

    func triggerAction(with type: LoginOptionType) {
        publisher.send(type)
    }
}
