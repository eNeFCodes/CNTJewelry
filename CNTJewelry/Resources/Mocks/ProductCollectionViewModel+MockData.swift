//
//  ProductCollectionViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/21/22.
//

import Foundation

extension ProductCollectionViewModel {
  static func mockData() -> ProductCollectionViewModel {
    .init(miniTitle: "Panthere Collection".uppercased(),
          title: "JUSTE UN CLOU\nbracelet\ngold".uppercased(),
          edition: "LIMITED EDITION",
          images: [
            .init(id: 0, image: "img_carousel_item1"),
            .init(id: 1, image: "img_carousel_item2"),
            .init(id: 2, image: "img_carousel_item3")
          ],
          detail: "This is an optional description to describe the bracelet  of the Juste un Clou collection created by Cartier trace the outlines of a style that is both modern and daring.",
          materials: "White gold, emeralds, onyx, diamonds",
          globalPrice: "£86,500",
          reference: "N6034302",
          launchDate: "September 2015",
          sellingPoints: [
            .init(id: 1,
                  detail: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
            .init(id: 2,
                  detail: "The harmonious interplay between the bands create an expression of attachment. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex."),
            .init(id: 3,
                  detail: "Relaunched by Cartier in 1981. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
          ])
  }
}
