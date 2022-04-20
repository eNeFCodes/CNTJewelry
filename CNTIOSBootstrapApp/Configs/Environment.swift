//
//  Environment.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/20/22.
//

import Foundation

enum Environment {

    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let appName = "APP_NAME"
            static let appBundleID = "APP_BUNDLE_ID"

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

extension Environment {

    static let appName: String = {
        guard let string = Environment.infoDictionary[Keys.Plist.appName] as? String else {
            fatalError("AppName not set in plist for this environment")
        }
        return string
    }()

    static let appBundleID: String = {
        guard let string = Environment.infoDictionary[Keys.Plist.appBundleID] as? String else {
            fatalError("AppBundleID not set in plist for this environment")
        }
        return string
    }()
}
