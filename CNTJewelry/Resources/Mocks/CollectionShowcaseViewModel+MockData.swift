//
//  CollectionShowcaseViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/17/22.
//

import Foundation

extension CollectionShowcaseViewModel {
  static func mockData() -> CollectionShowcaseViewModel {
    .init(miniTitle: "The cOLLECTION".uppercased(),
          title: "Trinity".uppercased(),
          details: "Conceived by Louis Cartier in 1924, the Trinity ring is one of the Maison’s signature pieces of jewellery.",
          productImage: "img_carousel_item4",
          productThumb: "img_carousel_item1")
  }
}
