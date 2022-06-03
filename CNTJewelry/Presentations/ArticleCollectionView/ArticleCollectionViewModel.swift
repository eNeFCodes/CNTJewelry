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

extension ArticleCollectionViewModel {
  class func mockItems() -> [WeeklyCollectionItemModelProtocol] {
    [
      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result5",
                                    date: "MAR 1, 2020"),

      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result1",
                                    date: "MAR 1, 2020"),

      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result2",
                                    date: "MAR 1, 2020"),

      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result3",
                                    date: "MAR 1, 2020")
    ]
  }
}
