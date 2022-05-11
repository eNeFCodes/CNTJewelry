//
//  AppSettings.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import Foundation

class AppSettings: ObservableObject {

    static let shared = AppSettings()

    @Published var isUserLoggedIn: Bool
    var user: User? {
        didSet {
            isUserLoggedIn = user != nil
        }
    }

    init(isUserLoggedIn: Bool = false,
         user: User? = nil) {

        self.isUserLoggedIn = isUserLoggedIn
        self.user = user
    }
}
