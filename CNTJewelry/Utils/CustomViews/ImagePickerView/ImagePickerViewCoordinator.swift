//
//  ImagePickerViewCoordinator.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/26/22.
//

import Foundation
import SwiftUI

class ImagePickerViewCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @ObservedObject private var model: ImagePickerViewModel

  init(model: ImagePickerViewModel) {
    self.model = model
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true)
    let mediaImage = info[.originalImage] as? UIImage
    let mediaURL = info[.mediaURL] as? URL
    let metaData = info[.mediaMetadata]
    let mediaType = info[.mediaType] as? String

    print("media: \(mediaImage.debugDescription) \nmediaURL: \(mediaURL.debugDescription) \nmetaData: \(metaData.debugDescription) \nmediaType: \(mediaType.debugDescription)")

    if let mediaImage = mediaImage {
      let mediaObject = ImagePickerViewModel.Media(mediaImage: Image(uiImage: mediaImage),
                                                   mediaURL: mediaURL,
                                                   metaData: metaData,
                                                   mediaType: mediaType)
      model.callback(mediaObject)
    } else {
      model.callback(nil)
    }
  }
}
