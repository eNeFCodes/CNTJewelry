//
//  InputFieldViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import Combine
import Foundation
import SwiftUI

extension InputFieldViewModel {
  enum EventAction {
    case onChange(_ id: Int, text: String)
  }
}

class InputFieldViewModel: ObservableObject, Identifiable {
  let id: Int
  let title: String
  let titleColor: Color
  let titleFont: Font
  @Published var inputText: String
  @Published var showTitle: Bool
  let placeholder: String
  let placeholderTextColor: Color
  let textColor: Color

  let showSeparator: Bool
  let separatorColor: Color
  let showButton: Bool
  let icon: Image?
  var activeIcon: Image?

  let publisher = PassthroughSubject<EventAction, Never>()

  init(id: Int,
       title: String = "Search CNT",
       titleColor: Color = ColorCollection.white,
       titleFont: Font = FontCollection.BrilliantCutProB7.regular(size: 15).font,
       inputText: String = "",
       showTitle: Bool = false,
       placeholder: String = "Search CNT",
       placeholderTextColor: Color = ColorCollection.gray,
       textColor: Color = ColorCollection.green,

       showSeparator: Bool = true,
       separatorColor: Color = ColorCollection.white,
       showButton: Bool = false,
       icon: Image? = nil,
       activeIcon: Image? = nil) {

    self.id = id
    self.title = title
    self.titleColor = titleColor
    self.titleFont = titleFont
    self.inputText = inputText
    self.showTitle = showTitle
    self.placeholder = placeholder
    self.placeholderTextColor = placeholderTextColor
    self.textColor = textColor

    self.showSeparator = showSeparator
    self.separatorColor = separatorColor
    self.showButton = showButton
    self.icon = icon
    self.activeIcon = activeIcon
  }

  func triggerAction() {

  }

  func onChange(text: String) {
    publisher.send(.onChange(id, text: text))
  }
}
