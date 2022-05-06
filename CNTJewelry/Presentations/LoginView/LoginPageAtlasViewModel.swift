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

    init(header: LoginPageHeaderViewModel = .init(title: L10n.App.Title.atlasTitle,
                                                  subTitle: L10n.App.Title.atlasSubTitle,
                                                  isPlain: false),
         welcome: LoginPageWelcomeViewModel = .init(title: L10n.App.Welcome.atlasTitle,
                                                    message: L10n.App.Welcome.atlasMessage)) {

        self.header = header
        self.welcome = welcome
    }
}
