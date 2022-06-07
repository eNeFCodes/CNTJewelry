//
//  ArticlePageViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

class ArticlePageViewModel: ObservableObject {
  let takeAway: ArticleTakeAwayViewModel

  init(takeAway: ArticleTakeAwayViewModel) {
    self.takeAway = takeAway
  }
}
