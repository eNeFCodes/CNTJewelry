//
//  TakeAway.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

struct TakeAway: Identifiable {
    let id: Int
    let detail: String

    var number: String {
        id > 9 ? "\(id)" : "0\(id)"
    }
}
