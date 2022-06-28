//
//  CheckBoxView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/28/22.
//

import SwiftUI

struct CheckBoxView: View {
  enum IconAlignment {
    case left
    case right
  }

  private let label: String
  private let labelFont: Font
  private let labelColor: Color
  private let labelAlignment: TextAlignment
  private let iconLocation: IconAlignment
  private let contentAlignment: VerticalAlignment
  @Binding private var isChecked: Bool

  init(label: String,
       labelFont: Font = FontCollection.BrilliantCutProB7.bold(size: 11).font,
       labelColor: Color = ColorCollection.white,
       labelAlignment: TextAlignment = .leading,
       iconLocation: IconAlignment = .left,
       contentAlignment: VerticalAlignment = .center,
       isChecked: Binding<Bool>) {
    self.label = label
    self.labelFont = labelFont
    self.labelColor = labelColor
    self.labelAlignment = labelAlignment
    self.iconLocation = iconLocation
    self.contentAlignment = contentAlignment
    _isChecked = isChecked
  }

  var body: some View {
    HStack(alignment: contentAlignment, spacing: 16) {
      if iconLocation == .left {
        Image(isChecked ? "ic_checkbox_selected" : "ic_checkbox_unselected")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20, alignment: .center)
      }

      Text(label)
        .accessibilityLabel(label)
        .font(labelFont)
        .foregroundColor(labelColor)
        .multilineTextAlignment(labelAlignment)

      if iconLocation == .right {
        Image(isChecked ? "ic_checkbox_selected" : "ic_checkbox_unselected")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20, alignment: .center)
      }
    }
  }
}

struct CheckBoxView_Previews: PreviewProvider {
  @State
  static var isChecked: Bool = false
  static var previews: some View {
    GeometryReader { geometry in
      VStack {
        CheckBoxView(label: "This image has \ntransparent background This image has \ntransparent background".uppercased(),
                     contentAlignment: .top,
                     isChecked: $isChecked)

        CheckBoxView(label: "This image has \ntransparent background This image has \ntransparent background".uppercased(),
                     contentAlignment: .center,
                     isChecked: $isChecked)

        CheckBoxView(label: "This image has \ntransparent background This image has \ntransparent background".uppercased(),
                     contentAlignment: .bottom,
                     isChecked: $isChecked)
      }
      .padding(30)
    }
    .background(.black)
  }
}
