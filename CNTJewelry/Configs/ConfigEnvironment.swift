//
//  ConfigEnvironment.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/20/22.
//

import Foundation

enum ConfigEnvironment {

    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let appName = String(kCFBundleNameKey)
            static let appBundleID = String(kCFBundleIdentifierKey)

            static let appEnv = "APP_ENV"
            static let appRootURL = "APP_ROOT_URL"
        }
    }

    // MARK: - Plist
    static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
}

extension ConfigEnvironment {

    static let appName: String = {
        guard let string = ConfigEnvironment.infoDictionary[Keys.Plist.appName] as? String else {
            fatalError("AppName not set in plist for this environment")
        }
        return string
    }()

    static let appBundleID: String = {
        guard let string = ConfigEnvironment.infoDictionary[Keys.Plist.appBundleID] as? String else {
            fatalError("AppBundleID not set in plist for this environment")
        }
        return string
    }()
}
