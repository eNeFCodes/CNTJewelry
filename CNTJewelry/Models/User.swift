//
//  User.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import Foundation

class User: ObservableObject {
    let username: String

    init(username: String) {
        self.username = username
    }
}
