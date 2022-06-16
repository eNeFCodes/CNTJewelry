//
//  ProductItemV3View.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import SwiftUI

struct ProductItemV3View: View {
  @ObservedObject private var model: ProductItemV3ViewModel

  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: ProductItemV3ViewModel, geometry: GeometryProxy, padding: CGFloat = 20) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    let paddedWidth = abs(geometry.size.width - (padding * 2))

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

      let detailsFont = FontCollection.font(for: FontCollection.FancyCutProB7.regular(size: 22)).weight(.light)
      Text(model.details)
        .accessibilityLabel(model.details)
        .font(detailsFont)
        .padding(.top, 8)

      let dateFont = FontCollection.font(for: FontCollection.FancyCutProB7.bold(size: 12))
      Text(model.date)
        .accessibilityLabel(model.date)
        .font(dateFont)
        .frame(height: 15, alignment: .leading)
        .padding(.top, 8)

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
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .center)
  }
}

struct WeeklyCollectionItemV3View_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ProductItemV3View(model: .init(title: "EYEBROW",
                                              subTitle: "Biasas fsa Vehicula Etiam Egestas lorem ipsum".uppercased(),
                                              details: "Nam ultrices dictum nunc at tempus. Praesent bibendum tellus tellus, quis fringilla quam convallis sed lorem ipsum longer sentence bla bla something else.",
                                              date: "MAR 1, 2020"),
                                 geometry: geometry)
    }
  }
}
