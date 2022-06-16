//
//  ArticleTextViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import Foundation

extension ArticleTextViewModel {
  static func mockData() -> ArticleTextViewModel {
    .init(title: "A favorite amongst artists".uppercased(),
          details: "Cartier Stockholm was first international jeweler to open its doors in the city—and represents our first step into the Scandinavian market. Here’s everything you need to know about the boutique and its importance to the Maison.")
  }

  static func mockData2() -> ArticleTextViewModel {
    .init(title: "A favorite amongst artists".uppercased(),
          details: "Cartier Stockholm was first international jeweler to open its doors in the city—and represents our first step into the Scandinavian market. Here’s everything you need to know about the boutique and its importance to the Maison.",
          bullet: .init(title: "The trio of gold holds a powerful metaphor:",
                        bulletedText: ["Pink for love",
                                       "White for friendship",
                                       "Yellow for faithfulness"],
                        details: "More than a symbol of love, the pureness of its lines also offers multiple interpretations."))
  }
}
