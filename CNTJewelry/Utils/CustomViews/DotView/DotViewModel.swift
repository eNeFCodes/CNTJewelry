//
//  DotViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

class DotViewModel: ObservableObject {

    let range: ClosedRange<Int>
    @Binding var activeIndex: Int
    let actionTitle: String

    let dotColor: Color
    let dotStrokeColor: Color
    let dotInactiveColor: Color
    let dotInactiveStrokeColor: Color
    let geometry: GeometryProxy
    let action: () -> Void

    init(range: ClosedRange<Int>,
         activeIndex: Binding<Int>,
         actionTitle: String = L10n.App.Content.getStarted,
         dotColor: Color = .orange,
         dotStrokeColor: Color = .orange,
         dotInactiveColor: Color = .clear,
         dotInactiveStrokeColor: Color = .orange,
         geometry: GeometryProxy,
         action: @escaping () -> Void) {

        self.range = range
        self._activeIndex = activeIndex
        self.actionTitle = actionTitle

        self.dotColor = dotColor
        self.dotStrokeColor = dotStrokeColor
        self.dotInactiveColor = dotInactiveColor
        self.dotInactiveStrokeColor = dotInactiveStrokeColor

        self.geometry = geometry
        self.action = action
    }
}
