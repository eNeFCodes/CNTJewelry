//
//  ArticlePageViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

extension ArticlePageViewModel {
  struct ArticleText {
    let fullText: String

    var initialText: String {
      String(fullText[...fullText.startIndex])
    }

    var bodyText: String {
      String(fullText[fullText.index(after: fullText.startIndex)...])
    }
  }
}

class ArticlePageViewModel: ObservableObject {
  let takeAway: ArticleTakeAwayViewModel
  let quote: QuoteViewModel
  let articleText: ArticleText

  init(takeAway: ArticleTakeAwayViewModel, quote: QuoteViewModel, articleText: ArticleText) {
    self.takeAway = takeAway
    self.quote = quote
    self.articleText = articleText
  }
}
