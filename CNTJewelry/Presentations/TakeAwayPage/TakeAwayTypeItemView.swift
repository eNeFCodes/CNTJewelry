//
//  TakeAwayTypeItemView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import SwiftUI

struct TakeAwayTypeItemView: View {
  @StateObject private var model: TakeAwayTypeItemViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat
  private let showTopSeparator: Bool
  private let showBotSeparator: Bool

  init(model: TakeAwayTypeItemViewModel,
       geometry: GeometryProxy,
       showTopSeparator: Bool = true,
       showBotSeparator: Bool = true,
       padding: CGFloat = 32) {
    _model = .init(wrappedValue: model)
    self.geometry = geometry
    self.padding = padding
    self.showTopSeparator = showTopSeparator
    self.showBotSeparator = showBotSeparator
  }

  var body: some View {
    Button {
      model.isSelected.toggle()
    } label: {
      VStack(spacing: 0) {
        if showTopSeparator {
          Rectangle()
            .frame(width: geometry.size.width, height: 1, alignment: .center)
            .foregroundColor(ColorCollection.white.opacity(0.3))
        }
        
        HStack {
          let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
          Text(model.title)
            .accessibilityLabel(model.title)
            .font(titleFont)
            .foregroundColor(model.isSelected ? ColorCollection.black : ColorCollection.white)
          Spacer(minLength: 0)
          let icon = model.isSelected ? "ic_closeActive_black" : "ic_closeInactive_white"
          Image(icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24, alignment: .center)
        }
        .padding(.horizontal, padding)
        .frame(width: geometry.size.width, height: 58, alignment: .center)

        if showBotSeparator {
          Rectangle()
            .frame(width: geometry.size.width, height: 1, alignment: .center)
            .foregroundColor(ColorCollection.white.opacity(0.3))
        }
      }
      .background(model.isSelected ? ColorCollection.white : ColorCollection.black)
    }
  }
}

struct TakeAwayTypeItemView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      TakeAwayTypeItemView(model: .stub,
                           geometry: geometry)
    }
  }
}
