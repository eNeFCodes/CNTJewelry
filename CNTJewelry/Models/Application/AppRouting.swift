//
//  AppRouting.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import Foundation

class AppRouting: ObservableObject {
    enum LoginType {
        case `default`
        case atlas
        case biometrics
    }

    @Published var isUserLoggedIn: Bool
    @Published var isLoginModeAtlas: Bool

    @Published var loginMode: LoginType {
        didSet {
            switch loginMode {
            case .atlas:
                isLoginModeAtlas = true
            default:
                isLoginModeAtlas = false
            }
        }
    }

    init(isUserLoggedIn: Bool = false,
         loginMode: LoginType = .default) {

        self.isUserLoggedIn = isUserLoggedIn
        self.isLoginModeAtlas = loginMode == .atlas
        self.loginMode = loginMode
    }
}
