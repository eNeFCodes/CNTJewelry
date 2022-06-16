//
//  ArticleDetailsViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/8/22.
//

import Foundation

struct ArticleDetailsViewModel {
  let details: String

  init(details: String) {
    self.details = details
  }

  var initialText: String {
    String(details[...details.startIndex])
  }

  var bodyText: String {
    String(details[details.index(after: details.startIndex)...])
  }
}
