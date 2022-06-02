//
//  WeeklyCollectionItemViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import Foundation

class WeeklyCollectionItemViewModel: ObservableObject, WeeklyCollectionItemModelProtocol {
  let viewId: UUID
  let title: String
  let subTitle: String
  let imageName: String
  let date: String
  @Published var isFavorite: Bool
  let showSeparator: Bool

  init(title: String,
       subTitle: String = "",
       imageName: String = "",
       date: String = "",
       isFavorite: Bool = false,
       showSeparator: Bool = true) {

    self.viewId = UUID()
    self.title = title
    self.subTitle = subTitle
    self.imageName = imageName
    self.date = date
    self.isFavorite = isFavorite
    self.showSeparator = showSeparator
  }

  func triggerFavorite() {

  }
}
