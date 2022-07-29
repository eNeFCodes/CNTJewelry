//
//  ForgotPasswordViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/29/22.
//

import Combine
import Foundation

class ForgotPasswordViewModel: ObservableObject {
  let header: LoginPageHeaderViewModel
  let welcome: LoginPageWelcomeViewModel
  let input: ForgotPasswordInputViewModel

  @Published var showForgotActionSuccess: Bool = false
  private var cancellables = Set<AnyCancellable>()
  
  init(header: LoginPageHeaderViewModel = .init(title: L10n.App.Content.title,
                                                subTitle: L10n.App.Content.subTitle),
       welcome: LoginPageWelcomeViewModel = .init(title: L10n.Login.Password.forgotTitle,
                                                  message: L10n.Login.Password.forgotMessage),
       input: ForgotPasswordInputViewModel = .stub) {
    self.header = header
    self.welcome = welcome
    self.input = input

    prepareNotifier()
  }

  private func prepareNotifier() {
    input.notifier
      .sink { [weak self] success in
        self?.showForgotActionSuccess = success
      }
      .store(in: &cancellables)
  }
}
