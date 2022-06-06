//
//  InputFieldView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import SwiftUI

extension InputFieldView {
  enum FocusedField: Hashable {
    case textField
  }
}

struct InputFieldView: View {
  @Binding private var inputText: String
  @State private var model: InputFieldViewModel
  @FocusState private var focusedField: InputFieldView.FocusedField?
  @State private var showTitle: Bool = false

  init(inputText: Binding<String>, model: InputFieldViewModel) {
    _inputText = inputText
    _model = .init(initialValue: model)
  }

  var body: some View {
    let maxFieldHeight: CGFloat = inputText.isEmpty ? 49 : 77
    GeometryReader { geometry in
      VStack(spacing: 8) {
        switch model.titleType {
        case .alwaysShow:
          buildTitleViewStack(geometry: geometry)
        default:
          if showTitle || !inputText.isEmpty {
            buildTitleViewStack(geometry: geometry)
          }
        }

        HStack(alignment: .center, spacing: 10) {
          ZStack(alignment: .leading) {
            if inputText.isEmpty {
              Text(model.placeholder)
                .accessibilityLabel(model.placeholder)
                .foregroundColor(model.placeholderTextColor)
            }
            TextField("", text: $inputText)
              .frame(height: 40, alignment: .leading)
              .foregroundColor(model.textColor)
              .focused($focusedField, equals: .textField)
          }

          if model.showButton, let icon = model.icon, let activeIcon = model.activeIcon {
            Button {
              if inputText.isEmpty {
                focusedField = .textField
              } else {
                inputText = ""
              }
            } label: {
              if !inputText.isEmpty {
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
      .onChange(of: inputText) { newValue in
        withAnimation {
          if model.titleType == .default {
            showTitle = !newValue.isEmpty
          }
        }
      }
    }
    .frame(height: maxFieldHeight, alignment: .center)
  }

  private func buildTitleViewStack(geometry: GeometryProxy) -> some View {
    Text(model.title)
      .accessibilityLabel(model.title)
      .foregroundColor(model.titleColor)
      .font(model.titleFont)
      .frame(width: geometry.size.width, height: 20, alignment: .leading)
      .transition(.move(edge: .bottom))
  }
}

struct InputFieldView_Previews: PreviewProvider {
  @State static var text: String = ""
  static var previews: some View {
    VStack {
      let config = InputFieldViewModel(showButton: true,
                                       icon: Image("ic_search_white"))

      let config2 = InputFieldViewModel(separatorColor: .yellow,
                                        showButton: true,
                                        icon: Image("ic_search"))

      let config3 = InputFieldViewModel(showSeparator: false,
                                        showButton: true,
                                        icon: Image("ic_eye_white"))

      ForEach([config, config2, config3], id: \.id) { config in
        InputFieldView(inputText: $text, model: config)
      }

      Spacer()
    }
    .background(ColorCollection.black)
  }

  private static func triggerInputFieldAction(id: Int, text: String) {
    print("triggered: \(id) -- \(text)")
  }
}
