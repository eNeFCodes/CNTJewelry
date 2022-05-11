//
//  AppEnvironment.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/27/22.
//

import SwiftUI

class AppEnvironment: ObservableObject {

    @Published var isLoading: Bool

    init(isLoading: Bool = false) {
        self.isLoading = isLoading
    }
}
