//
//  ProductItemV2ViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import Foundation

// WeeklyCollectionViewModel.ContentType.variant2
class ProductItemV2ViewModel: ObservableObject, WeeklyCollectionItemModelProtocol {
  let viewId: UUID
  let type: WeeklyCollectionViewModel.ContentType

  let imageName: String
  let title: String
  let subTitle: String
  let details: String
  let time: String
  let author: String
  let authorDetails: String
  let location: String

  @Published var isFavorite: Bool
  let showSeparator: Bool

  init(imageName: String,
       title: String,
       subTitle: String,
       details: String,
       time: String,
       author: String,
       authorDetails: String,
       location: String,
       isFavorite: Bool = false,
       showSeparator: Bool = true) {

    self.viewId = UUID()
    self.type = .variant2

    self.imageName = imageName
    self.title = title
    self.subTitle = subTitle
    self.details = details
    self.time = time
    self.author = author
    self.authorDetails = authorDetails
    self.location = location

    self.isFavorite = isFavorite
    self.showSeparator = showSeparator
  }

  func triggerFavorite() {
    isFavorite = !isFavorite
  }
}
