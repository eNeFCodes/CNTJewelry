//
//  FTUEViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import SwiftUI

protocol FTUEViewContentItemProtocol {
    var id: Int { get }
    var type: FTUEViewModel.FTUEViewContentItemType { get }
}

class FTUEViewModel: ObservableObject {

    enum FTUEViewContentItemType {
        case intro
        case showcase
    }

    let items: [FTUEViewContentItemProtocol]
    @Published var activeIndex: Int

    init(items: [FTUEViewContentItemProtocol], activeIndex: Int = 0) {
        self.items = items
        self.activeIndex = activeIndex
    }
}

extension FTUEViewModel {
    class func mockItems() -> [FTUEViewContentItemProtocol] {
        [
            FTUEIntroViewModel(id: 0, introLogo: "img_lanyards"),
            FTUEShowcaseViewModel(id: 1, title: "EASILY ACCESS YOUR\nDAILY BRIEFING",
                                  details: "Your Brief is curated with the things you need to know today.",
                                  contentImage: "img_ftue2"),
            FTUEShowcaseViewModel(id: 2, title: "CHEAT SHEET HELPS\nWITH YOUR SALES",
                                  details: "You can find all the latest\nproduct and allocation stories.",
                                  contentImage: "img_ftue3"),
            FTUEShowcaseViewModel(id: 3, title: "ACCESS HELPFUL\nRESOURCES ON THE GO",
                                  details: "Find and download articles,\nfiles, and resources.",
                                  contentImage: "img_ftue4")
        ]
    }
}
