//
//  View+Ext.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/27/22.
//

import Foundation
import SwiftUI

extension View {
  func alert<AlertContent: View>(isActive: Binding<Bool>,
                                 alertContent: @escaping () -> AlertContent) -> some View {
    modifier(AlertView(isActive: isActive,
                       alertContent: alertContent))
  }
}
