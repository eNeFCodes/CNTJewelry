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

      let bulletNumberFont = FontCollection.FancyCutProB7.bold(size: 18).font
      let bulletSize = bullet.addNumberToBullets ? CGSize(width: 3, height: 3) : CGSize(width: 6, height: 6)
      ForEach(bullet.bulletedText, id: \.id) { item in
        HStack {
          if bullet.addNumberToBullets {
            Text(item.page.description)
              .accessibilityLabel(item.page.description)
              .font(bulletNumberFont)
              .foregroundColor(ColorCollection.gold)
          }

          Circle()
            .frame(width: bulletSize.width, height: bulletSize.height, alignment: .center)
            .foregroundColor(ColorCollection.gold)

          Text(item.text)
            .accessibilityLabel(item.text)
            .font(textFont)
            .foregroundColor(ColorCollection.black)
        }
        .frame(width: contentWidth, alignment: .leading)
      }

      if let details = bullet.details {
        Text(details)
          .accessibilityLabel(details)
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
      ArticleTextView(model: ArticleTextViewModel.mockData3(),
                      geometry: geometry)
    }
  }
}
