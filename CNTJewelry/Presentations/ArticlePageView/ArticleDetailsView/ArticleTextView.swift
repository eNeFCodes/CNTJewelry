//
//  ArticleTextView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import SwiftUI

struct ArticleTextView: View {
  private let model: ArticleTextViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: ArticleTextViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    VStack(spacing: 8) {
      let contentWidth = geometry.size.width - (padding * 2)

      if !model.title.isEmpty {
        let titleFont = FontCollection.BrilliantCutProB7.medium(size: 14).font
        Text(model.title)
          .accessibilityLabel(model.title)
          .font(titleFont)
          .foregroundColor(ColorCollection.black)
          .frame(width: contentWidth, alignment: .leading)
      }

      let detailsFont = FontCollection.FancyCutProB7.regular(size: 18).font
      Text(model.details)
        .accessibilityLabel(model.details)
        .font(detailsFont)
        .foregroundColor(ColorCollection.black)
        .frame(width: contentWidth, alignment: .leading)

      if let bullet = model.bullet {
        buildBulletedTextListViewStack(contentWidth: contentWidth, bullet: bullet)
          .padding(.top, 24)
      }
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }

  private func buildBulletedTextListViewStack(contentWidth: CGFloat, bullet: ArticleTextViewModel.Bullet) -> some View {
    VStack(spacing: 8) {
      let textFont = FontCollection.FancyCutProB7.regular(size: 18).font
      Text(bullet.title)
        .accessibilityLabel(bullet.title)
        .font(textFont)
        .foregroundColor(ColorCollection.black)
        .frame(width: contentWidth, alignment: .leading)

      ForEach(bullet.bulletedText, id: \.self) { text in
        HStack {
          Circle()
            .frame(width: 6, height: 6, alignment: .center)
            .foregroundColor(ColorCollection.gold)

          Text(text)
            .accessibilityLabel(text)
            .font(textFont)
            .foregroundColor(ColorCollection.black)
        }
        .frame(width: contentWidth, alignment: .leading)
      }

      if !bullet.details.isEmpty {
        Text(bullet.details)
          .accessibilityLabel(bullet.details)
          .font(textFont)
          .foregroundColor(ColorCollection.black)
          .frame(width: contentWidth, alignment: .leading)
      }
    }
  }
}

struct ArticleTextView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ArticleTextView(model: .init(title: "A favorite amongst artists".uppercased(),
                                   details: "Cartier Stockholm was first international jeweler to open its doors in the city—and represents our first step into the Scandinavian market. Here’s everything you need to know about the boutique and its importance to the Maison.",
                                   bullet: .init(title: "The trio of gold holds a powerful metaphor:",
                                                 bulletedText: ["Pink for love",
                                                                "White for friendship",
                                                                "Yellow for faithfulness"],
                                                 details: "More than a symbol of love, the pureness of its lines also offers multiple interpretations.")),
                      geometry: geometry)
    }
  }
}
