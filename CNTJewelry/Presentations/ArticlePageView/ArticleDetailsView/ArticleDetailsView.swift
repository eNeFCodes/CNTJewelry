//
//  ArticleDetailsView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/8/22.
//

import SwiftUI

struct ArticleDetailsView: View {
  private let model: ArticleDetailsViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: ArticleDetailsViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    VStack {
      let textContentWidth = abs(geometry.size.width - (padding * 2))
      let titleFontHeight: CGFloat = 140
      let detailsTitleFont = FontCollection.FancyCutProB7.regular(size: titleFontHeight).font
      let detailsBodyFont = FontCollection.FancyCutProB7.regular(size: 18).uiFont

      ZStack {
        let boxPath = UIBezierPath(rect: .init(x: 0, y: 0, width: 90, height: 110))
        TextView(text: model.bodyText,
                 model: .init(font: detailsBodyFont,
                              exclusionPaths: [boxPath]))
        .accessibilityLabel(model.bodyText)
        .foregroundColor(ColorCollection.black)
        .frame(width: textContentWidth, alignment: .leading)
        .overlay {
          GeometryReader { geometry in
            Text(model.initialText)
              .accessibilityLabel(model.initialText)
              .font(detailsTitleFont)
              .foregroundColor(ColorCollection.black)
              .frame(width: 90, height: titleFontHeight, alignment: .center)
          }
        }
      }
      .frame(width: textContentWidth, alignment: .topLeading)
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .top)
  }
}

struct ArticleDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ArticleDetailsView(model: .init(details: "The Mainson’s registers from 1924 make the first mention of a ring consisting of three inseparably interlaced bands, each made of a different metal: platinum, pink gold and yellow. A bracelet with han identical concept was also created the same year. The clean-lined design appealed to Elsie de Wolfe, famouse American interior designer, who would be the first to purchase one.\n\nNews combinations of colors were introduced over the years. While the most emblematic joined yellow, pinka nd white gold, Cartier also dared to introduce audacious hues, such as green gold."), geometry: geometry)
    }
  }
}
