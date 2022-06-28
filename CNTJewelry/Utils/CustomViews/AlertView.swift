//
//  AlertView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/28/22.
//

import SwiftUI

struct AlertView<AlertContent: View>: ViewModifier {
  @Binding private var isActive: Bool
  private let alertContent: () -> AlertContent

  init(isActive: Binding<Bool>, alertContent: @escaping () -> AlertContent) {
    _isActive = isActive
    self.alertContent = alertContent
  }

  func body(content: Content) -> some View {
    buildContentBody(content: content)
  }

  @ViewBuilder
  private func buildContentBody(content: Content) -> some View {
    if isActive {
      content
        .overlay(content: alertContent)
    } else {
      content
    }
  }
}

struct AlertView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {

    }
  }
}
