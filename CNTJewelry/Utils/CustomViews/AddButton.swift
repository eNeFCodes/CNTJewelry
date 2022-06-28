//
//  AddButton.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/28/22.
//

import SwiftUI

struct AddButton: View {
  private let label: String
  private let labelFont: Font
  private let labelColor: Color
  private let action: () -> Void

  init(label: String = L10n.Shared.Content.add,
       labelFont: Font = FontCollection.BrilliantCutProB7.bold(size: 10).font,
       labelColor: Color = ColorCollection.white,
       action: @escaping () -> Void) {
    self.label = label
    self.labelFont = labelFont
    self.labelColor = labelColor
    self.action = action
  }

  var body: some View {
    Button {
      action()
    } label: {
      HStack(spacing: 4) {
        Text(label)
          .accessibilityLabel(label)
          .foregroundColor(labelColor)
          .font(labelFont)

        Image("ic_plus_white")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 24, height: 24, alignment: .center)
      }
      .frame(width: 88, height: 32, alignment: .center)
    }
    .border(ColorCollection.white, width: 1)
  }
}

struct AddButton_Previews: PreviewProvider {
  static var previews: some View {
    AddButton {

    }
  }
}
