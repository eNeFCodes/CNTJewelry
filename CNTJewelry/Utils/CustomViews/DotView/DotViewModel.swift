//
//  DotViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

class DotViewModel: ObservableObject {

    let range: Range<Int>
    @Binding var activeIndex: Int
    let actionTitle: String
    let actionTitleColor: Color
    let actionBGColor: Color
    let padding: CGFloat

    let dotColor: Color
    let dotStrokeColor: Color
    let dotInactiveColor: Color
    let dotInactiveStrokeColor: Color

    let action: () -> Void

    init(range: Range<Int>,
         activeIndex: Binding<Int>,
         actionTitle: String = L10n.App.Content.getStarted,
         actionTitleColor: Color = ColorCollection.white,
         actionBGColor: Color = ColorCollection.red,
         padding: CGFloat = 32,
         dotColor: Color = ColorCollection.orange,
         dotStrokeColor: Color = ColorCollection.orange,
         dotInactiveColor: Color = ColorCollection.clear,
         dotInactiveStrokeColor: Color = ColorCollection.orange,
         action: @escaping () -> Void) {

        self.range = range
        _activeIndex = activeIndex
        self.actionTitle = actionTitle
        self.actionTitleColor = actionTitleColor
        self.actionBGColor = actionBGColor
        self.padding = padding

        self.dotColor = dotColor
        self.dotStrokeColor = dotStrokeColor
        self.dotInactiveColor = dotInactiveColor
        self.dotInactiveStrokeColor = dotInactiveStrokeColor

        self.action = action
    }
}
