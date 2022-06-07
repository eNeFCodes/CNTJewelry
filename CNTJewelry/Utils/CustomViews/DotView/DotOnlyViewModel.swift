//
//  DotOnlyViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

class DotOnlyViewModel: ObservableObject {
    let range: Range<Int>
    @Binding var activeIndex: Int

    let dotColor: Color
    let dotStrokeColor: Color
    let dotInactiveColor: Color
    let dotInactiveStrokeColor: Color

    init(range: Range<Int>,
         activeIndex: Binding<Int>,
         dotColor: Color = .orange,
         dotStrokeColor: Color = .orange,
         dotInactiveColor: Color = .clear,
         dotInactiveStrokeColor: Color = .orange) {

        self.range = range
        _activeIndex = activeIndex
        
        self.dotColor = dotColor
        self.dotStrokeColor = dotStrokeColor
        self.dotInactiveColor = dotInactiveColor
        self.dotInactiveStrokeColor = dotInactiveStrokeColor
    }
}
