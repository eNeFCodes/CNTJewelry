//
//  LoginPageAtlasViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Foundation

class LoginPageAtlasViewModel: ObservableObject {

    let header: LoginPageHeaderViewModel
    let welcome: LoginPageWelcomeViewModel
    let input: LoginPageInputViewModel

    init(header: LoginPageHeaderViewModel = .init(title: L10n.App.Title.atlasTitle,
                                                  subTitle: L10n.App.Title.atlasSubTitle,
                                                  isPlain: false),
         welcome: LoginPageWelcomeViewModel = .init(title: L10n.App.Welcome.atlasTitle,
                                                    message: L10n.App.Welcome.atlasMessage),
         input: LoginPageInputViewModel = .init(email: .init(placeholder: L10n.Login.InputField.emailPlaceholder,
                                                             inpuString: ""),
                                                password: .init(placeholder: L10n.Login.InputField.passwordPlaceholder,
                                                                inpuString: "",
                                                                isSecured: true))) {
        self.header = header
        self.welcome = welcome
        self.input = input
    }
}
