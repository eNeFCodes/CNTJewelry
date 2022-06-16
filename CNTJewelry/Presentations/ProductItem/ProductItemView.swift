//
//  ProductItemView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import SwiftUI

struct ProductItemView: View {
  @ObservedObject private var model: ProductItemViewModel

  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: ProductItemViewModel, geometry: GeometryProxy, padding: CGFloat = 20) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      let paddedWidth = abs(geometry.size.width - (padding * 2))
      Image(model.imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: paddedWidth, height: paddedWidth, alignment: .center)
        .clipped()

      VStack(alignment: .leading, spacing: 8) {
        let titleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 10))
        Text(model.title)
          .accessibilityLabel(model.title)
          .font(titleFont)
          .frame(minHeight: 12, alignment: .leading)

        HStack(alignment: .top, spacing: 10) {
          VStack(alignment: .leading) {
            let subTitleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 22))
            Text(model.subTitle)
              .accessibilityLabel(model.subTitle)
              .font(subTitleFont)
              .frame(minHeight: 24, alignment: .leading)
          }
          Spacer()
          VStack(alignment: .trailing) {
            Button {
              model.triggerFavorite()
            } label: {
              let iconName = model.isFavorite ? "ic_bookmark_selected" : "ic_bookmark"
              Image(iconName)
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
            }
          }
        }
        .frame(width: paddedWidth, alignment: .top)

        let dateFont = FontCollection.font(for: FontCollection.FancyCutProB7.bold(size: 12))
        Text(model.date)
          .accessibilityLabel(model.date)
          .font(dateFont)
          .frame(height: 15, alignment: .leading)

        if model.showSeparator {
          VStack {
            let p1 = CGPoint(x: 0, y: 0)
            let p2 = CGPoint(x: paddedWidth, y: 0)
            ShapeView(withCoordinates: [p1, p2])
              .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, dash: [2]))
              .foregroundColor(ColorCollection.goldSeparator)
          }
          .frame(width: paddedWidth, height: 1, alignment: .center)
          .padding(.top, 22)
        }
      }
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .center)
  }
}

struct WeeklyCollectionItemView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ProductItemView(model: .init(title: "EVENT",
                                            subTitle: "NEW BAIGNOIRE COLLECTION",
                                            imageName: "img_result1",
                                            date: "MAR 1, 2020"),
                               geometry: geometry)
    }
  }
}
