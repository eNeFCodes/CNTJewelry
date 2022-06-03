//
//  InputFieldView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import SwiftUI

struct InputFieldView: View {
  @ObservedObject private var model: InputFieldViewModel

  init(model: InputFieldViewModel) {
    self.model = model
  }

  var body: some View {
    let maxFieldHeight: CGFloat = model.inputText.isEmpty ? 49 : 77
    GeometryReader { geometry in
      VStack(spacing: 8) {
        if model.showTitle {
          Text(model.title)
            .accessibilityLabel(model.title)
            .foregroundColor(model.titleColor)
            .font(model.titleFont)
            .frame(width: geometry.size.width, height: 20, alignment: .leading)
            .transition(.move(edge: .bottom))
        }

        HStack(alignment: .center, spacing: 10) {
          ZStack(alignment: .leading) {
            if model.inputText.isEmpty {
              Text(model.placeholder)
                .accessibilityLabel(model.placeholder)
                .foregroundColor(model.placeholderTextColor)
            }
            TextField("", text: $model.inputText)
              .frame(height: 40, alignment: .leading)
              .foregroundColor(model.textColor)
              .onChange(of: model.inputText) { newValue in
                model.onChange(text: newValue)
              }
          }

          if model.showButton, let icon = model.icon, let activeIcon = model.activeIcon {
            Button {
              model.trigger()
            } label: {
              if !model.inputText.isEmpty {
                activeIcon
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 40, height: 40, alignment: .center)
              } else {
                icon
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 40, height: 40, alignment: .center)
              }
            }
          }
        }

        if model.showSeparator {
          let p1 = CGPoint(x: 0, y: 0)
          let p2 = CGPoint(x: abs(geometry.size.width), y: 0)
          ShapeView(withCoordinates: [p1, p2])
            .stroke(model.separatorColor, lineWidth: 1)
        }
      }
      .frame(width: geometry.size.width, height: maxFieldHeight, alignment: .center)
      .onChange(of: model.inputText) { newValue in
        withAnimation {
          model.showTitle = !newValue.isEmpty
        }
      }
    }
    .frame(height: maxFieldHeight, alignment: .center)
  }
}

struct InputFieldView_Previews: PreviewProvider {
  @State static var text: String = ""
  static var previews: some View {
    VStack {
      let config = InputFieldViewModel(id: 0,
                                       showButton: true,
                                       icon: Image("ic_search_white"))

      let config2 = InputFieldViewModel(id: 1,
                                        separatorColor: .yellow,
                                        showButton: true,
                                        icon: Image("ic_search"))

      let config3 = InputFieldViewModel(id: 3,
                                        showSeparator: false,
                                        showButton: true,
                                        icon: Image("ic_eye_white"))

      ForEach([config, config2, config3], id: \.id) { config in
        InputFieldView(model: config)
      }

      Spacer()
    }
    .background(ColorCollection.black)
  }

  private static func triggerInputFieldAction(id: Int, text: String) {
    print("triggered: \(id) -- \(text)")
  }
}
