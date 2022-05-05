//
//  ShapeView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct ShapeView: Shape {
    let path: Path

    init(path: Path) {
        self.path = path
    }

    func path(in rect: CGRect) -> Path {
        return path
    }
}
