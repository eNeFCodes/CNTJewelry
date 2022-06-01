//
//  NeedToKnowInfoView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/1/22.
//

import SwiftUI

struct NeedToKnowInfoView: View {
  private let model: NeedToKnowInfo
  private let padding: CGFloat

  init(model: NeedToKnowInfo, padding: CGFloat = 30) {
    self.model = model
    self.padding = padding
  }

  var body: some View {
    ZStack {
      VStack {
        Spacer()
        Image("img_ftue_bottom_bg")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: 143, alignment: .top)
          .clipped()
      }

      VStack(spacing: 0) {
        Image(model.icon)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 74, height: 74, alignment: .center)
          .clipped()
          .padding(.top, 20)

        let titleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.medium(size: 22))
        Text(model.title)
          .accessibilityLabel(model.title)
          .foregroundColor(ColorCollection.white)
          .font(titleFont)
          .padding(.top, 20)
          .multilineTextAlignment(.center)

        let p1 = CGPoint(x: 0, y: 0)
        let p2 = CGPoint(x: 0, y: 60)
        ShapeView(withCoordinates: [p1, p2])
          .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
          .frame(width: 1, height: 60, alignment: .center)
          .foregroundColor(ColorCollection.gold)
          .padding(.vertical, padding)

        let messageFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 11))
        Text(model.message)
          .accessibilityLabel(model.message)
          .foregroundColor(ColorCollection.white)
          .font(messageFont)
          .multilineTextAlignment(.center)

        Image("ic_3arrow_red")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 43, height: 12, alignment: .center)
          .padding(.top, 10)
      }
      .padding(.horizontal, padding)
    }
    .background(ColorCollection.black)
    .tag(model.id)
  }
}

struct NeedToKnowInfoView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      VStack {
        NeedToKnowInfoView(model: .init(id: 0,
                                        title: "1 here are the key things you need to know today!".uppercased(),
                                        message: "Swipe left to get started".uppercased(),
                                        icon: "ic_knowTo1"))
        .frame(width: geometry.size.width - 64, height: 399, alignment: .center)
      }
      .frame(width: geometry.size.width, alignment: .center)
      .padding(.top, 80)
    }
    .background(.white)
  }
}
