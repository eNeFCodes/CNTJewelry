//
//  LoginPageOptionViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Foundation

class LoginPageOptionViewModel: ObservableObject {
    struct Action: Identifiable {
        let id: Int
        let title: String
        let action: (_ id: Int) -> Void
    }

    let actions: [Action]

    init(actions: [Action]) {
        self.actions = actions
    }
}
