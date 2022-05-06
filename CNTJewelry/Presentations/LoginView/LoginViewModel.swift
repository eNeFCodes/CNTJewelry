//
//  LoginViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import Foundation

class LoginViewModel: ObservableObject {

    let header: LoginPageHeaderViewModel
    let welcome: LoginPageWelcomeViewModel

    init(header: LoginPageHeaderViewModel = .init(title: L10n.App.Title.cntTitle,
                                                  subTitle: L10n.App.Title.cntSubTitle),
         welcome: LoginPageWelcomeViewModel = .init(title: L10n.App.Welcome.cntTitle,
                                                    message: L10n.App.Welcome.cntMessage)) {

        self.header = header
        self.welcome = welcome
    }
}
