//
//  ArticlePageViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

class ArticlePageViewModel: ObservableObject {
  let takeAway: ArticleTakeAwayViewModel
  let quote: QuoteViewModel

  init(takeAway: ArticleTakeAwayViewModel, quote: QuoteViewModel) {
    self.takeAway = takeAway
    self.quote = quote
  }
}
