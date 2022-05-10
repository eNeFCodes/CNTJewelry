//
//  ContentViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/22/22.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {

    let welcome: WelcomeViewModel
    let login: LoginViewModel

    init(welcome: WelcomeViewModel = .init(),
         login: LoginViewModel = .init()) {

        self.welcome = welcome
        self.login = login
    }
}
