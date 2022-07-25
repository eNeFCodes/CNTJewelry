//
//  CTAButton.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/28/22.
//

import SwiftUI

extension CTAButton {
  static let DefaultHeight: CGFloat = 56
}

struct CTAButton: View {
  private let label: String
  private let labelFont: Font
  private let labelColor: Color
  private let backgroundColor: Color
  private let backgroundInactiveColor: Color
  private let borderColor: Color
  private let borderInactiveColor: Color
  private let isEnabled: Bool
  private let isBorderEnabled: Bool
  private let size: CGSize
  private let action: () -> Void

  init(label: String = L10n.Shared.Content.submit,
       labelFont: Font = FontCollection.BrilliantCutProB7.bold(size: 12).font,
       labelColor: Color = ColorCollection.white,
       backgroundColor: Color = ColorCollection.clear,
       backgroundInactiveColor: Color = ColorCollection.clear,
       borderColor: Color = ColorCollection.white,
       borderInactiveColor: Color = ColorCollection.textInActive,
       isBorderEnabled: Bool = true,
       isEnabled: Bool = true,
       size: CGSize,
       action: @escaping () -> Void) {
    self.label = label
    self.labelFont = labelFont
    self.labelColor = labelColor
    self.backgroundColor = backgroundColor
    self.backgroundInactiveColor = backgroundInactiveColor
    self.borderColor = borderColor
    self.borderInactiveColor = borderInactiveColor
    self.isBorderEnabled = isBorderEnabled
    self.isEnabled = isEnabled
    self.size = size
    self.action = action
  }

  var body: some View {
    let borderColor = isBorderEnabled ? borderColor : ColorCollection.clear
    Button {
      action()
    } label: {
      HStack(alignment: .center) {
        Text(label)
          .accessibilityLabel(label)
          .foregroundColor(isEnabled ? labelColor : ColorCollection.textInActive)
          .font(labelFont)
      }
      .frame(width: size.width, height: size.height, alignment: .center)
    }
    .background(isEnabled ? backgroundColor : backgroundInactiveColor)
    .clipped()
    .border(isEnabled ? borderColor : borderInactiveColor, width: 1)
    .disabled(!isEnabled)
  }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
      GeometryReader { geometry in
        VStack {
          let contentWidth = geometry.size.width - 64
          CTAButton(size: .init(width: contentWidth, height: 56)) {

          }

          CTAButton(isEnabled: false, size: .init(width: contentWidth, height: 56)) {

          }

          CTAButton(backgroundColor: ColorCollection.red,
                    size: .init(width: contentWidth, height: CTAButton.DefaultHeight)) {

          }

          CTAButton(backgroundColor: ColorCollection.red,
                    isBorderEnabled: false,
                    size: .init(width: contentWidth, height: CTAButton.DefaultHeight)) {

          }
        }
        .padding(32)
        .frame(width: geometry.size.width, alignment: .center)
      }
      .background(.black)
    }
}
