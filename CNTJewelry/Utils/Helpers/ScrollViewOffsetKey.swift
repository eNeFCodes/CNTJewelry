//
//  ScrollViewOffsetKey.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/21/22.
//

import Foundation
import SwiftUI

struct ScrollViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
