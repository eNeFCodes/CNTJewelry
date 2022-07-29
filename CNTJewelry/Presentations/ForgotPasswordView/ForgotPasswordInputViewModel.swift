//
//  ForgotPasswordInputViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/29/22.
//

import Foundation
import Combine

class ForgotPasswordInputViewModel: ObservableObject {
  @Published var email: String
  let actionTitle: String
  let notifier = PassthroughSubject<Bool, Never>()

  private var subscriptions = Set<AnyCancellable>()
  private var loginPublisher = PassthroughSubject<Void, Never>()

  init(email: String = "",
       actionTitle: String = L10n.Login.InputField.actionTitle) {

    self.email = email
    self.actionTitle = actionTitle

    prepareSubmit()
  }
}

extension ForgotPasswordInputViewModel {
  var canProceed: Bool {
    !email.isEmpty
  }

  func clearInputs() {
    email = ""
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

  private func prepareSubmit() {
    loginPublisher
      .map { self.networkRequest() }
      .switchToLatest()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] success in
        guard let self = self else{ return }
        self.notifier.send(success)
      }
      .store(in: &subscriptions)
  }

  func triggerSubmit() {
    loginPublisher.send()
  }
}

extension ForgotPasswordInputViewModel {
  static let stub: ForgotPasswordInputViewModel = {
    .init(actionTitle: L10n.Shared.Content.submit)
  }()
}
