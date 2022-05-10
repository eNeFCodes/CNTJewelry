//
//  Biometrics.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/10/22.
//

import Foundation
import LocalAuthentication

class Biometrics {

    enum AuthStatus {
        case authenticated
        case failed(error: Error)
    }

    enum LoginAuthStatus {
        case loggingIn
        case authenticated(user: User)
        case failed(error: Error)
    }

    class func triggerBiometrics(completion: @escaping (AuthStatus) -> Void) {
        let context = LAContext()
        context.localizedReason = L10n.Login.Biometrics.contextReason
        context.localizedCancelTitle = L10n.Login.Biometrics.cancelTitle

        var error: NSError?
        let policy: LAPolicy = .deviceOwnerAuthentication
        if context.canEvaluatePolicy(policy, error: &error) {
            context.evaluatePolicy(policy, localizedReason: L10n.Login.Biometrics.evaluateReason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        completion(.authenticated)
                    } else {
                        let errMsg = error?.localizedDescription ?? L10n.Login.Biometrics.evaluateError
                        let err = NSError.init(domain: "com.Biometrics.error", code: -9999, userInfo: ["message": errMsg])
                        completion(.failed(error: err))
                    }
                }
            }
        } else {
            let errMsg = error?.localizedDescription ?? L10n.Login.Biometrics.evaluateError
            let err = NSError.init(domain: "com.Biometrics.error", code: -9999, userInfo: ["message": errMsg])
            completion(.failed(error: err))
        }
    }
}
