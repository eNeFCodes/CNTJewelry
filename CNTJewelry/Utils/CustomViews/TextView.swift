//
//  TextView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/8/22.
//

import Foundation
import SwiftUI
import UIKit

struct TextView: UIViewRepresentable {
  typealias UIViewType = UITextView

  @Binding private var text: String

  private let font: UIFont?
  private let textColor: UIColor?
  private let textAlignment: NSTextAlignment
  private let exclusionPaths: [UIBezierPath]

  private let isEditable: Bool
  private let isSelectable: Bool
  private let autocorrectionType: UITextAutocorrectionType
  private let autocapitalizationType: UITextAutocapitalizationType

  init(text: Binding<String>,
       font: UIFont? = .systemFont(ofSize: 10),
       textColor: UIColor? = .black,
       textAlignment: NSTextAlignment = .left,
       exclusionPaths: [UIBezierPath],

       isEditable: Bool = false,
       isSelectable: Bool = false,
       autocorrectionType: UITextAutocorrectionType = .default,
       autocapitalizationType: UITextAutocapitalizationType = .sentences) {

    _text = text
    self.font = font
    self.textColor = textColor
    self.textAlignment = textAlignment
    self.exclusionPaths = exclusionPaths

    self.isEditable = isEditable
    self.isSelectable = isSelectable

    self.autocorrectionType = autocorrectionType
    self.autocapitalizationType = autocapitalizationType
  }

  init(text: String,
       font: UIFont? = .systemFont(ofSize: 10),
       textColor: UIColor? = .black,
       textAlignment: NSTextAlignment = .left,
       exclusionPaths: [UIBezierPath],

       isEditable: Bool = false,
       isSelectable: Bool = false,
       autocorrectionType: UITextAutocorrectionType = .default,
       autocapitalizationType: UITextAutocapitalizationType = .sentences) {

    _text = .constant(text)
    self.font = font
    self.textColor = textColor
    self.textAlignment = textAlignment
    self.exclusionPaths = exclusionPaths

    self.isEditable = isEditable
    self.isSelectable = isSelectable

    self.autocorrectionType = autocorrectionType
    self.autocapitalizationType = autocapitalizationType
  }

  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.backgroundColor = .clear

    textView.text = text
    textView.font = font
    textView.textColor = textColor
    textView.textAlignment = textAlignment
    textView.isSelectable = isSelectable
    textView.isEditable = isEditable
    textView.textContainer.exclusionPaths = exclusionPaths

    textView.autocorrectionType = autocorrectionType
    textView.autocapitalizationType = autocapitalizationType

    return textView
  }

  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
    uiView.font = font
  }
}
