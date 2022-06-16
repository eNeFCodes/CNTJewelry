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
  let productDetails: ProductDetailsViewModel
  let articleText2: ArticleTextViewModel
  let articleText3: ArticleTextViewModel
  let productItem: ProductItemViewModel
  let articleText4: ArticleTextViewModel

  init(takeAway: ArticleTakeAwayViewModel,
       quote: QuoteViewModel,
       articleText: ArticleText,
       productDetails: ProductDetailsViewModel,
       articleText2: ArticleTextViewModel,
       articleText3: ArticleTextViewModel,
       productItem: ProductItemViewModel,
       articleText4: ArticleTextViewModel) {

    self.takeAway = takeAway
    self.quote = quote
    self.articleText = articleText
    self.productDetails = productDetails
    self.articleText2 = articleText2
    self.articleText3 = articleText3
    self.productItem = productItem
    self.articleText4 = articleText4
  }
}
