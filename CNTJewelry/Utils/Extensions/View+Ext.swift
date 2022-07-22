//
//  View+Ext.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/27/22.
//

import Foundation
import SwiftUI

extension View {
  func overlayWindow<WindowContent: View>(isActive: Binding<Bool>,
                                          windowContent: @escaping () -> WindowContent) -> some View {
    modifier(OverlayWindow(isActive: isActive,
                           windowContent: windowContent))
  }
}
