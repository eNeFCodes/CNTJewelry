//
//  FTUEIntroViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import Foundation

class FTUEIntroViewModel: ObservableObject, FTUEViewContentItemProtocol {
    let id: Int
    let type: FTUEViewModel.FTUEViewContentItemType
    let introLogo: String
    let introMessage: String

    init(id: Int,
         introLogo: String,
         introMessage: String = L10n.Ftue.Intro.welcomeMessage) {

        self.id = id
        self.type = .intro
        self.introLogo = introLogo
        self.introMessage = introMessage
    }
}

extension FTUEIntroViewModel {
    var username: String {
        guard let user = AppSettings.shared.user else { return "Guest" }
        return user.username
    }
}
