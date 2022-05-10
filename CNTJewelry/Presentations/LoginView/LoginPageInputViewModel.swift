//
//  LoginPageInputViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Combine
import SwiftUI

class LoginPageInputViewModel: ObservableObject {
    class Field: ObservableObject {
        var placeholder: String
        @Published var inpuString: String
        let isSecured: Bool

        init(placeholder: String, inpuString: String, isSecured: Bool = false) {
            self.placeholder = placeholder
            self.inpuString = inpuString
            self.isSecured = isSecured
        }
    }

    var email: Field
    var password: Field
    let actionTitle: String

    @Published private(set) var canProceed: Bool = false
    private var subscriptions = Set<AnyCancellable>()

    private(set) lazy var canProceedPublisher: CurrentValueSubject<Bool, Never> = {
        let canProceed = !email.inpuString.isEmpty && !password.inpuString.isEmpty
        let publisher = CurrentValueSubject<Bool, Never>(canProceed)
        return publisher
    }()

    init(email: Field = .init(placeholder: L10n.Login.InputField.emailPlaceholder,
                              inpuString: ""),
         password: Field = .init(placeholder: L10n.Login.InputField.passwordPlaceholder,
                                 inpuString: "",
                                 isSecured: true),
         actionTitle: String = L10n.Login.InputField.actionTitle) {

        self.email = email
        self.password = password
        self.actionTitle = actionTitle

        let merged = email.inpuString.publisher.merge(with: password.inpuString.publisher)
        merged.sink { [weak self] _ in
            guard let self = self else { return }
            self.canProceed = !email.inpuString.isEmpty && !password.inpuString.isEmpty
        }
        .store(in: &subscriptions)
    }
}
