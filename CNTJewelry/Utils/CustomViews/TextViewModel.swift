//
//  TextViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/27/22.
//

import Combine
import Foundation
import SwiftUI

class TextViewModel: ObservableObject {
  let font: UIFont?
  let textColor: UIColor?
  let textAlignment: NSTextAlignment
  let exclusionPaths: [UIBezierPath]

  let textLimit: Int
  let isEditable: Bool
  let isSelectable: Bool
  let autocorrectionType: UITextAutocorrectionType
  let autocapitalizationType: UITextAutocapitalizationType

  init(font: UIFont? = .systemFont(ofSize: 10),
       textColor: UIColor? = .black,
       textAlignment: NSTextAlignment = .left,
       exclusionPaths: [UIBezierPath] = [],

       textLimit: Int = 0,
       isEditable: Bool = false,
       isSelectable: Bool = false,
       autocorrectionType: UITextAutocorrectionType = .default,
       autocapitalizationType: UITextAutocapitalizationType = .sentences) {

    self.font = font
    self.textColor = textColor
    self.textAlignment = textAlignment
    self.exclusionPaths = exclusionPaths

    self.textLimit = textLimit
    self.isEditable = isEditable
    self.isSelectable = isSelectable

    self.autocorrectionType = autocorrectionType
    self.autocapitalizationType = autocapitalizationType
  }
}
