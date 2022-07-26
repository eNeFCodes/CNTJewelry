//
//  ImagePickerView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/26/22.
//

import Foundation
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
  typealias UIViewControllerType = UIImagePickerController

  @ObservedObject private var model: ImagePickerViewModel

  init(model: ImagePickerViewModel) {
    self.model = model
  }

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    picker.mediaTypes = model.mediaTypes
    picker.sourceType = model.sourceType
    return picker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

  }

  func makeCoordinator() -> ImagePickerViewCoordinator {
    .init(model: model)
  }
}
