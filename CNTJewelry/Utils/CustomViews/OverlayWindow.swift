//
//  OverlayWindow.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/28/22.
//

import SwiftUI

struct OverlayWindow<WindowContent: View>: ViewModifier {
  @Binding private var isActive: Bool
  private let windowContent: () -> WindowContent

  init(isActive: Binding<Bool>, windowContent: @escaping () -> WindowContent) {
    _isActive = isActive
    self.windowContent = windowContent
  }

  func body(content: Content) -> some View {
    content
      .overlay(content: buildContentBody)
  }

  @ViewBuilder
  private func buildContentBody() -> some View {
    windowContent()
      .opacity(isActive ? 1 : 0)
  }
}

struct OverlayWindow_Previews: PreviewProvider {
  static var previews: some View {
    VStack {

    }
  }
}
