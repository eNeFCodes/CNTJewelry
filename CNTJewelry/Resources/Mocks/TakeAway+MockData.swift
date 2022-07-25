//
//  TakeAway+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import Foundation

extension TakeAwayTypeViewModel {
  static let stubTakeAway: TakeAwayTypeViewModel = {
    .init(title: L10n.TakeAway.Item.takeAwayTypeTitle,
          items: TakeAwayTypeViewModel.stubTakeAwayItems,
          limit: 1)
  }()

  static let stubTopics: TakeAwayTypeViewModel = {
    .init(title: L10n.TakeAway.Item.takeAwayTopicTitle,
          items: TakeAwayTypeViewModel.stubTopicItems,
          limit: 1)
  }()

  static let stubOtherTopics: TakeAwayTypeViewModel = {
    .init(title: L10n.TakeAway.Item.takeAwayOtherTopicTitle,
          items: TakeAwayTypeViewModel.stubOtherTopicItems,
          limit: 2)
  }()
}

extension TakeAwayTypeViewModel {
  static let stubTakeAwayItems: [TakeAwayTypeItemViewModel] = {
    [
      .init(title: "Did You Know"),
      .init(title: "Sales Tip"),
      .init(title: "Shout-out"),
      .init(title: "Takeaway"),
      .init(title: "The Red Carpet"),
      .init(title: "Speak Cartier")
    ]
  }()

  static let stubTopicItems: [TakeAwayTypeItemViewModel] = {
    [
      .init(title: "Accessories"),
      .init(title: "Antiques"),
      .init(title: "Art of Selling"),
      .init(title: "Boutique Opening"),
      .init(title: "Cartier DNA"),
      .init(title: "Celebrities"),
      .init(title: "Client. Experience"),
      .init(title: "Craftsmanship"),
      .init(title: "Eyewear"),
      .init(title: "Fragrance"),
      .init(title: "Gemology"),
      .init(title: "High Jewelry"),
      .init(title: "Jewelry"),
      .init(title: "Learning & Development"),
      .init(title: "Leather Goods"),
      .init(title: "Maison History"),
      .init(title: "Product Launch"),
      .init(title: "Retail Operations"),
      .init(title: "Watchmaking")
    ]
  }()

  static let stubOtherTopicItems: [TakeAwayTypeItemViewModel] = {
    [
      .init(title: "Accessories"),
      .init(title: "Antiques"),
      .init(title: "Art of Selling"),
      .init(title: "Boutique Opening"),
      .init(title: "Cartier DNA"),
      .init(title: "Celebrities"),
      .init(title: "Craftsmanship"),
      .init(title: "Eyewear"),
      .init(title: "Fragrance"),
      .init(title: "Gemology"),
      .init(title: "High Jewelry"),
      .init(title: "Jewelry"),
      .init(title: "Learning & Development"),
      .init(title: "Leather Goods"),
      .init(title: "Maison History"),
      .init(title: "Product Launch"),
      .init(title: "Retail Operations"),
      .init(title: "Watchmaking")
    ]
  }()
}

extension TakeAwayTypeItemViewModel {
  static var stubTakeAway: TakeAwayTypeItemViewModel {
    .init(title: "Did You Know")
  }
}
