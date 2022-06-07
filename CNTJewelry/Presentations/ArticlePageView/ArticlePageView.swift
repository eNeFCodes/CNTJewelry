//
//  ArticlePageView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import SwiftUI

struct ArticlePageView: View {
  @StateObject private var model: ArticlePageViewModel

  init(model: ArticlePageViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      ScrollViewReader { proxy in
        ScrollView(.vertical, showsIndicators: false) {
          LazyVStack {
            ArticleTakeAwayView(model: model.takeAway, geometry: geometry)

            QuoteView(model: model.quote, geometry: geometry)
          }
        }
      }
    }
  }
}

struct ArticlePageView_Previews: PreviewProvider {
  static var previews: some View {
    ArticlePageView(model: .init(takeAway: ArticleTakeAwayViewModel.mockImageData(),
                                 quote: .init(quotes: QuoteViewModel.mockItems())))
  }
}
