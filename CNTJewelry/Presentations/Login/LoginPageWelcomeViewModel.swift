//
//  LoginPageWelcomeViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Foundation

class LoginPageWelcomeViewModel: ObservableObject {

    let title: String
    let message: String

    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
