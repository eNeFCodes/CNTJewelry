//
//  LoginPageInputViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Combine
import SwiftUI

class LoginPageInputViewModel: ObservableObject {
    class Field: ObservableObject {
        var placeholder: String
        @Published var inpuString: String
        let isSecured: Bool

        init(placeholder: String, inpuString: String, isSecured: Bool = false) {
            self.placeholder = placeholder
            self.inpuString = inpuString
            self.isSecured = isSecured
        }
    }

    @Published var email: String
    @Published var password: String
    let actionTitle: String

    init(email: String = "",
         password: String = "",
         actionTitle: String = L10n.Login.InputField.actionTitle) {

        self.email = email
        self.password = password
        self.actionTitle = actionTitle
    }
}

extension LoginPageInputViewModel {
    var canProceed: Bool {
        !email.isEmpty && !password.isEmpty
    }
}
