//
//  ArticleCollectionViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import Foundation

class ArticleCollectionViewModel: ObservableObject {
  let title: String
  let details: String
  let items: [WeeklyCollectionItemModelProtocol]

  init(title: String, details: String, items: [WeeklyCollectionItemModelProtocol]) {
    self.title = title
    self.details = details
    self.items = items
  }
}
