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

    init(welcome: WelcomeViewModel = .init()) {
        self.welcome = welcome
    }
}
