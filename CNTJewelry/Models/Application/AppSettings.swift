//
//  AppSettings.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import Foundation

class AppSettings: ObservableObject {

    static let shared = AppSettings()
    var user: User?

    init(user: User? = nil) {
        self.user = user
    }
}
