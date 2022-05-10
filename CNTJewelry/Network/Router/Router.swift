//
//  Router.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/20/22.
//

import Foundation

/// Contains routing URLs
enum Router {

    typealias PlistKeys = ConfigEnvironment.Keys.Plist

    static let environment: String = {
        guard let string = ConfigEnvironment.infoDictionary[PlistKeys.appEnv] as? String else {
            fatalError("App Environment not set in plist for this environment")
        }
        return string
    }()

    static let appRootURL: URL = {
        guard let string = ConfigEnvironment.infoDictionary[PlistKeys.appRootURL] as? String else {
            fatalError("App Root URL not set in plist for this environment")
        }
        guard let url = URL(string: string) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
}
