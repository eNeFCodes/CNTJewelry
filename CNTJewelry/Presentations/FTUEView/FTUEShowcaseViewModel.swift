//
//  FTUEShowcaseViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import Foundation

class FTUEShowcaseViewModel: ObservableObject, Identifiable, FTUEViewContentItemProtocol {
    let id: Int
    let type: FTUEViewModel.FTUEViewContentItemType
    let title: String
    let details: String
    let contentImage: String

    init(id: Int,
         title: String,
         details: String,
         contentImage: String) {

        self.id = id
        self.type = .showcase
        self.title = title
        self.details = details
        self.contentImage = contentImage
    }
}
