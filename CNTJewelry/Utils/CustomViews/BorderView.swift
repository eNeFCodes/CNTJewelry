//
//  BorderView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct BorderView: Shape {
    let coordinates: [CGPoint]
    var shouldClosePath: Bool

    init(coordinates: [CGPoint], shouldClosePath: Bool = false) {
        self.coordinates = coordinates
        self.shouldClosePath = shouldClosePath
    }

    func path(in rect: CGRect) -> Path {
        var borderPath = Path()
        for (idx, coordinate) in coordinates.enumerated() {
            if idx > 0 {
                borderPath.addLine(to: coordinate)
            } else {
                borderPath.move(to: coordinate)
            }
        }

        if shouldClosePath {
            borderPath.closeSubpath()
        }
        return borderPath
    }
}
