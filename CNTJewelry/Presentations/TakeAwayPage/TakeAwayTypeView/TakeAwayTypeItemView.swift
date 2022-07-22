//
//  TakeAwayTypeItemView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import SwiftUI

struct TakeAwayTypeItemView: View {
  @ObservedObject private var model: TakeAwayTypeItemViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat
  private let showTopSeparator: Bool
  private let showBotSeparator: Bool
  private let action: (_ model: TakeAwayTypeItemViewModel) -> Void

  init(model: TakeAwayTypeItemViewModel,
       geometry: GeometryProxy,
       showTopSeparator: Bool = true,
       showBotSeparator: Bool = true,
       padding: CGFloat = 32,
       action: @escaping (_ model: TakeAwayTypeItemViewModel) -> Void) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
    self.showTopSeparator = showTopSeparator
    self.showBotSeparator = showBotSeparator
    self.action = action
  }

  var body: some View {
    Button {
      action(model)
    } label: {
      VStack(spacing: 0) {
        let separatorColor = model.isSelected
        ? ColorCollection.black.opacity(0.3)
        : ColorCollection.white.opacity(0.3)
        if showTopSeparator {
          Rectangle()
            .frame(width: geometry.size.width, height: 1, alignment: .center)
            .foregroundColor(separatorColor)
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
            .foregroundColor(separatorColor)
        }
      }
      .background(model.isSelected ? ColorCollection.white : ColorCollection.black)
    }
  }
}

struct TakeAwayTypeItemView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      TakeAwayTypeItemView(model: .stubTakeAway,
                           geometry: geometry) { _ in }
    }
  }
}
