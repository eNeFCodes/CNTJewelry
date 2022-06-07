//
//  ArticleTakeAwayViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

extension ArticleTakeAwayViewModel {
  static func mockData() -> ArticleTakeAwayViewModel {
    .init(miniTitle: "HISTORY",
          title: "Trinity, a Mainson emblem and jewelery icon".uppercased(),
          infoDate: "APR 02, 2020",
          infoAuthor: "Jane Doe, Lorem Ispum Role",
          infoLocation: "5th Avenue Mansion",
          infoDetail: "Created in 1924 by Louis Cartier, the Trinity ring soon became one of the emblems of the Maison and a jewelery icon.",
          takeAways: [
            .init(id: 1,
                  detail: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
            .init(id: 2,
                  detail: "The harmonious interplay between the bands create an expression of attachment. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex."),
            .init(id: 3,
                  detail: "Relaunched by Cartier in 1981. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
          ])
  }

  static func mockImageData() -> ArticleTakeAwayViewModel {
    .init(miniTitle: "HISTORY",
          title: "Trinity, a Mainson emblem and jewelery icon".uppercased(),
          image: "img_bg_article1",
          infoDate: "APR 02, 2020",
          infoAuthor: "Jane Doe, Lorem Ispum Role",
          infoLocation: "5th Avenue Mansion",
          infoDetail: "Created in 1924 by Louis Cartier, the Trinity ring soon became one of the emblems of the Maison and a jewelery icon.",
          takeAways: [
            .init(id: 1,
                  detail: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
            .init(id: 2,
                  detail: "The harmonious interplay between the bands create an expression of attachment. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex."),
            .init(id: 3,
                  detail: "Relaunched by Cartier in 1981. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
          ])
  }
}
