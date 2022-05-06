//
//  LoginPageInputViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

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

    var email: Field
    var password: Field

    init(email: Field = .init(placeholder: L10n.Login.InputField.emailPlaceholder,
                              inpuString: ""),
         password: Field = .init(placeholder: L10n.Login.InputField.passwordPlaceholder,
                                 inpuString: "",
                                 isSecured: true)) {

        self.email = email
        self.password = password
    }
}
