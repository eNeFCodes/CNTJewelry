//
//  ProductItemV3ViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import Foundation

// WeeklyCollectionViewModel.ContentType.variant3
class ProductItemV3ViewModel: ObservableObject, WeeklyCollectionItemModelProtocol {
  let viewId: UUID
  let type: WeeklyCollectionViewModel.ContentType

  let title: String
  let subTitle: String
  let details: String
  let date: String
  @Published var isFavorite: Bool
  let showSeparator: Bool

  init(title: String,
       subTitle: String,
       details: String,
       date: String,
       isFavorite: Bool = false,
       showSeparator: Bool = true) {

    self.viewId = UUID()
    self.type = .variant3

    self.title = title
    self.subTitle = subTitle
    self.details = details
    self.date = date
    self.isFavorite = isFavorite
    self.showSeparator = showSeparator
  }

  func triggerFavorite() {
    isFavorite = !isFavorite
  }
}
