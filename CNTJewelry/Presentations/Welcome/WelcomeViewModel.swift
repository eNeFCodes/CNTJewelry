//
//  WelcomeViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import Foundation

class WelcomeViewModel: ObservableObject {

    let welcome: String

    init(welcome: String = L10n.App.Content.welcomeMessage) {
        self.welcome = welcome
    }
}
