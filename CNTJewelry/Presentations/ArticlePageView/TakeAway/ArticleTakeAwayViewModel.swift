//
//  ArticleTakeAwayViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

struct ArticleTakeAwayViewModel {
    let miniTitle: String
    let title: String
    let image: String?
    let infoDate: String
    let infoAuthor: String
    let infoLocation: String
    let infoDetail: String
    let takeAwayTitle: String
    let takeAways: [TakeAway]

    var hasImage: Bool {
        guard let _ = image else { return false }
        return true
    }

    init(miniTitle: String,
         title: String,
         image: String? = nil,
         infoDate: String,
         infoAuthor: String,
         infoLocation: String,
         infoDetail: String,
         takeAwayTitle: String = L10n.Article.TakeAway.title,
         takeAways: [TakeAway]) {

        self.miniTitle = miniTitle
        self.title = title
        self.image = image
        self.infoDate = infoDate
        self.infoAuthor = infoAuthor
        self.infoLocation = infoLocation
        self.infoDetail = infoDetail
        self.takeAwayTitle = takeAwayTitle
        self.takeAways = takeAways
    }
}
