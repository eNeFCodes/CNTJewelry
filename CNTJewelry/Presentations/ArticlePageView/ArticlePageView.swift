//
//  ArticlePageView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import SwiftUI

struct ArticlePageView: View {
  @StateObject private var model: ArticlePageViewModel
  private let padding: CGFloat = 32

  init(model: ArticlePageViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      ScrollViewReader { proxy in
        ScrollView(.vertical, showsIndicators: false) {
          LazyVStack(spacing: 48) {
            ArticleTakeAwayView(model: model.takeAway, geometry: geometry)
            createArticleTextViewStack(geometry: geometry)
            QuoteView(model: model.quote, geometry: geometry)
          }
        }
      }
    }
  }

  private func createArticleTextViewStack(geometry: GeometryProxy) -> some View {
    VStack {
      let initialFont = FontCollection.FancyCutProB7.regular(size: 140).font
      let bodyFont = FontCollection.FancyCutProB7.regular(size: 18).uiFont

      let contentWidth = abs(geometry.size.width - (padding * 2))
      let toleranceHeight: CGFloat = geometry.size.width == 390 ? 60 : 80
      let fullTextFrameHeight = model.articleText.bodyText.constrainedSize(inCanvas: .init(width: contentWidth, height: .infinity), font: bodyFont) + toleranceHeight

      let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 93, height: 100))
      TextView(text: model.articleText.bodyText,
               font: bodyFont,
               exclusionPaths: [path])
      .padding(.horizontal, padding)
      .frame(maxWidth: geometry.size.width, minHeight: fullTextFrameHeight, maxHeight: .infinity, alignment: .center)
      .overlay {
        GeometryReader { geometry in
          HStack {
            Text(model.articleText.initialText)
              .font(initialFont)
              .foregroundColor(.green)
              .frame(width: 93, height: 120, alignment: .center)
          }
          .padding(.horizontal, padding)
          .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
      }
    }
  }
}

struct ArticlePageView_Previews: PreviewProvider {
  static var previews: some View {
    ArticlePageView(model: .init(takeAway: ArticleTakeAwayViewModel.mockImageData(),
                                 quote: .init(quotes: QuoteViewModel.mockItems()),
                                 articleText: .init(fullText: "The Mainson’s registers from 1924 make the first mention of a ring consisting of three inseparably interlaced bands, each made of a different metal: platinum, pink gold and yellow. A bracelet with han identical concept was also created the same year. The clean-lined design appealed to Elsie de Wolfe, famouse American interior designer, who would be the first to purchase one.\n\nNews combinations of colors were introduced over the years. While the most emblematic joined yellow, pinka nd white gold, Cartier also dared to introduce audacious hues, such as green gold.")))
  }
}
