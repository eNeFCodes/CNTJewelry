//
//  ArticleCollectionViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

extension ArticleCollectionViewModel {
  class func mockItems() -> [WeeklyCollectionItemModelProtocol] {
    [
      ProductItemViewModel(title: "EVENT",
                           subTitle: "NEW BAIGNOIRE COLLECTION",
                           imageName: "img_result5",
                           date: "MAR 1, 2020"),

      ProductItemViewModel(title: "EVENT",
                           subTitle: "NEW BAIGNOIRE COLLECTION",
                           imageName: "img_result1",
                           date: "MAR 1, 2020"),

      ProductItemViewModel(title: "EVENT",
                           subTitle: "NEW BAIGNOIRE COLLECTION",
                           imageName: "img_result2",
                           date: "MAR 1, 2020"),

      ProductItemViewModel(title: "EVENT",
                           subTitle: "NEW BAIGNOIRE COLLECTION",
                           imageName: "img_result3",
                           date: "MAR 1, 2020")
    ]
  }

  class func mockItems2() -> [WeeklyCollectionItemModelProtocol] {
    [
      ProductItemViewModel(title: "EVENT",
                           subTitle: "A NEW CHAPTER ON\nNEW BOND STREET",
                           imageName: "img_result11",
                           date: "MAR 1, 2020"),

      ProductItemViewModel(title: "EVENT",
                           subTitle: "A NEW CHAPTER ON\nNEW BOND STREET",
                           imageName: "img_result11",
                           date: "MAR 1, 2020"),

      ProductItemViewModel(title: "EVENT",
                           subTitle: "A NEW CHAPTER ON\nNEW BOND STREET",
                           imageName: "img_result11",
                           date: "MAR 1, 2020"),

      ProductItemViewModel(title: "EVENT",
                           subTitle: "A NEW CHAPTER ON\nNEW BOND STREET",
                           imageName: "img_result11",
                           date: "MAR 1, 2020")
    ]
  }
}
