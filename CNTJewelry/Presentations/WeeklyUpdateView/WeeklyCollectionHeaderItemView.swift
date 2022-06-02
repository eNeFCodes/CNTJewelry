//
//  WeeklyCollectionHeaderItemView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import SwiftUI

struct WeeklyCollectionHeaderItemView: View {
  @ObservedObject private var model: WeeklyCollectionHeaderItemViewModel
  private let padding: CGFloat

  init(model: WeeklyCollectionHeaderItemViewModel, padding: CGFloat = 32) {
    self.model = model
    self.padding = padding
  }

  var body: some View {
    GeometryReader { geometry in
      VStack {
        let redBGViewWidth = abs(geometry.size.width - 85)
        VStack {
          let titleFont = FontCollection.font(for: FontCollection.FancyCutCondProB7.bold(size: 30))
          Text(model.title)
            .accessibilityLabel(model.title)
            .foregroundColor(ColorCollection.white)
            .font(titleFont)
            .multilineTextAlignment(.trailing)
        }
        .padding(.top, padding)
        .padding(.horizontal, padding)
        .padding(.bottom, 144)
        .frame(width: redBGViewWidth, alignment: .topTrailing)
        .background(ColorCollection.red)
        .mask {
          GeometryReader { geometry in
            let curve: CGFloat = 20
            let p1 = CGPoint(x: curve, y: 0)
            let p2 = CGPoint(x: geometry.size.width, y: 0)
            let p3 = CGPoint(x: geometry.size.width, y: geometry.size.height)
            let p4 = CGPoint(x: 0, y: geometry.size.height)
            let p5 = CGPoint(x: 0, y: curve)
            ShapeView(withCoordinates: [p1, p2, p3, p4, p5], shouldClosePath: true)
          }
        }
      }
      .frame(width: geometry.size.width, alignment: .trailing)
      .background {
        GeometryReader { geometry in
          let imgBackdropHeight = abs(geometry.size.height - 48)
          VStack {
            Spacer()
            Image("img_bg_article")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: geometry.size.width, height: imgBackdropHeight, alignment: .top)
              .clipped()
          }
        }
      }
    }
  }
}

struct WeeklyCollectionHeaderItemView_Previews: PreviewProvider {
  static var previews: some View {
    WeeklyCollectionHeaderItemView(model: .init(title: "This week\naround CNT".uppercased()))
  }
}
