//
//  TextViewCoordinator.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/27/22.
//

import Foundation
import UIKit
import SwiftUI

class TextViewCoordinator: NSObject, UITextViewDelegate {

  @Binding private var text: String
  @ObservedObject private var model: TextViewModel

  init(text: Binding<String>,
       model: TextViewModel) {
    _text = text
    self.model = model
  }

  func textViewDidChange(_ textView: UITextView) {
    text = textView.text
  }

  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if !text.isEmpty {
      return range.location < model.textLimit
    }

    return true
  }
}
