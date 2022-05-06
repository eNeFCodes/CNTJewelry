//
//  LoginPageHeaderViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import Foundation

class LoginPageHeaderViewModel: ObservableObject {

    let title: String
    let subTitle: String
    let isPlain: Bool

    init(title: String, subTitle: String, isPlain: Bool = true) {
        self.title = title
        self.subTitle = subTitle
        self.isPlain = isPlain
    }
}

extension LoginPageHeaderViewModel {
    var fullString: String {
        title + subTitle
    }
}
