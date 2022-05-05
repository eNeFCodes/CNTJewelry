//
//  Optional+Ext.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/20/22.
//

import Foundation
import UIKit

protocol Defaultable {
    static var defaultValue: Self { get }
}

extension Optional where Wrapped: Defaultable {
    /// Safely unwraps optional that conforms to `Defaultable` with provided `Default Value`
    var unwrapped: Wrapped { self ?? Wrapped.defaultValue }
}

// Declarations: Primitive types

extension String: Defaultable {
    static var defaultValue: String { "" }
}

extension Int: Defaultable {
    static var defaultValue: Int { 0 }
}

extension CGFloat: Defaultable {
    static var defaultValue: CGFloat { 0.0 }
}

extension Double: Defaultable {
    static var defaultValue: Double { 0.0 }
}

extension Bool: Defaultable {
    static var defaultValue: Bool { false }
}
