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
  enum TitleType {
    case `default`
    case alwaysShow
  }
}

struct InputFieldViewModel: Identifiable {
  let id: UUID
  let title: String
  let titleColor: Color
  let titleFont: Font
  let titleType: TitleType
  let placeholder: String
  let placeholderTextColor: Color
  let textColor: Color

  let showSeparator: Bool
  let separatorColor: Color
  let showButton: Bool
  let icon: Image?
  var activeIcon: Image?

  init(title: String = L10n.SearchPage.Content.inputTitle,
       titleColor: Color = ColorCollection.white,
       titleFont: Font = FontCollection.BrilliantCutProB7.regular(size: 15).font,
       titleType: TitleType = .default,
       placeholder: String = L10n.SearchPage.Content.inputTitle,
       placeholderTextColor: Color = ColorCollection.gray,
       textColor: Color = ColorCollection.green,

       showSeparator: Bool = true,
       separatorColor: Color = ColorCollection.white,
       showButton: Bool = false,
       icon: Image? = nil,
       activeIcon: Image? = nil) {

    self.id = UUID()
    self.title = title
    self.titleColor = titleColor
    self.titleFont = titleFont
    self.titleType = titleType
    self.placeholder = placeholder
    self.placeholderTextColor = placeholderTextColor
    self.textColor = textColor

    self.showSeparator = showSeparator
    self.separatorColor = separatorColor
    self.showButton = showButton
    self.icon = icon
    self.activeIcon = activeIcon
  }
}
