//
//  AppEnvironment.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/27/22.
//

import Foundation

class AppEnvironment: ObservableObject {

    @Published var isLoading: Bool
    @Published var isUserLoggedIn: Bool

    init(isLoading: Bool = false,
         isUserLoggedIn: Bool = false) {

        self.isLoading = isLoading
        self.isUserLoggedIn = isUserLoggedIn
    }
}
