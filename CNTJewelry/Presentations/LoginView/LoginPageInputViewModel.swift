//
//  LoginPageInputViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Combine
import SwiftUI

class LoginPageInputViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    let actionTitle: String

    private var subscriptions = Set<AnyCancellable>()
    private var loginPublisher = PassthroughSubject<Void, Never>()

    init(email: String = "",
         password: String = "",
         actionTitle: String = L10n.Login.InputField.actionTitle) {

        self.email = email
        self.password = password
        self.actionTitle = actionTitle
    }
}

extension LoginPageInputViewModel {
    var canProceed: Bool {
        !email.isEmpty && !password.isEmpty
    }

    @MainActor
    func triggerLogin() async -> Bool {
        let requestURL = URL(string: "https://github.com/eNeFCodes/CNTJewelry")!
        do {
            let (responseData, _) = try await URLSession.shared.data(from: requestURL)
            print("responseData:", responseData)
            return true
        } catch {
            return false
        }
    }

    private func networkRequest() -> AnyPublisher<Bool, Never> {
        let requestURL = URL(string: "https://github.com/eNeFCodes/CNTJewelry")!
        return URLSession.shared
            .dataTaskPublisher(for: requestURL)
            .map { data, _ in !data.isEmpty }
            .print("networkRequest")
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }

    func triggerLogin(callback: @escaping (_ isLoggedIn: Bool) -> Void) {
        loginPublisher
            .map { self.networkRequest() }
            .switchToLatest()
            .sink { success in
                DispatchQueue.main.async {
                    callback(success)
                }
            }
            .store(in: &subscriptions)
        loginPublisher.send()
    }
}
