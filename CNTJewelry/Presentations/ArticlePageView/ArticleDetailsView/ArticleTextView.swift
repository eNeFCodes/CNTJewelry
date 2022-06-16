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
      let titleFont = FontCollection.BrilliantCutProB7.medium(size: 14).font
      Text(model.title)
        .accessibilityLabel(model.title)
        .font(titleFont)
        .foregroundColor(ColorCollection.black)
        .frame(width: contentWidth, alignment: .leading)

      let detailsFont = FontCollection.FancyCutProB7.regular(size: 18).font
      Text(model.details)
        .accessibilityLabel(model.details)
        .font(detailsFont)
        .foregroundColor(ColorCollection.black)
        .frame(width: contentWidth, alignment: .leading)
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }
}

struct ArticleTextView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ArticleTextView(model: .init(title: "A favorite amongst artists".uppercased(),
                                   details: "Cartier Stockholm was first international jeweler to open its doors in the city—and represents our first step into the Scandinavian market. Here’s everything you need to know about the boutique and its importance to the Maison."),
                      geometry: geometry)
    }
  }
}
