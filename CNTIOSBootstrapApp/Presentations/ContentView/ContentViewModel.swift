//
//  ContentViewModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/22/22.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {

    let welcome: String

    init(welcome: String = L10n.App.Content.welcomeMessage) {
        self.welcome = welcome
    }
}
