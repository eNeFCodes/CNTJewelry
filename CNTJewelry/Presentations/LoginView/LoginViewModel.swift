//
//  LoginViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {

    let header: LoginPageHeaderViewModel
    let welcome: LoginPageWelcomeViewModel
    let option: LoginPageOptionViewModel
    @Published var isLoginModeAtlas: Bool = false

    private var subscriptions = Set<AnyCancellable>()

    init(header: LoginPageHeaderViewModel = .init(title: L10n.App.Title.cntTitle,
                                                  subTitle: L10n.App.Title.cntSubTitle),
         welcome: LoginPageWelcomeViewModel = .init(title: L10n.App.Welcome.cntTitle,
                                                    message: L10n.App.Welcome.cntMessage),
         option: LoginPageOptionViewModel = .init(actions: LoginViewModel.loginOptions())) {

        self.header = header
        self.welcome = welcome
        self.option = option

        self.setSubscribers()
    }

    private func setSubscribers() {
        option.publisher.sink { type in
            self.isLoginModeAtlas = type == .atlasLogin
        }
        .store(in: &subscriptions)
    }
}

extension LoginViewModel {
    class func loginOptions() -> [LoginPageOptionViewModel.Action] {
        [
            .init(id: 0, title: L10n.Login.Option.atlas, type: .atlasLogin),
            .init(id: 1, title: L10n.Login.Option.biometrics, type: .faceAndTouchID)
        ]
    }
}
