//
//  ForgotPasswordSuccessViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/29/22.
//

import Foundation

class ForgotPasswordSuccessViewModel: ObservableObject {
  let header: LoginPageHeaderViewModel
  let welcome: LoginPageWelcomeViewModel

  @Published var showForgotActionSuccess: Bool = false

  init(header: LoginPageHeaderViewModel = .init(title: L10n.App.Content.title,
                                                subTitle: L10n.App.Content.subTitle),
       welcome: LoginPageWelcomeViewModel = .init(title: L10n.Login.Password.forgotSuccessTitle,
                                                  message: L10n.Login.Password.forgotSuccessMessage)) {
    self.header = header
    self.welcome = welcome
  }
}
