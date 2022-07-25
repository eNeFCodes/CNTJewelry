//
//  Text+Ext.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/25/22.
//

import SwiftUI

extension Text {
  func combine(with texts: [Text]) -> some View {
    texts.reduce(self, +)
  }
}
