//
//  ImagePickerViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/26/22.
//

import Foundation
import SwiftUI

extension ImagePickerViewModel {
  struct Media {
    let id: UUID = UUID()
    let mediaImage: Image
    let mediaURL: URL?
    let metaData: Any?
    let mediaType: String?

    var name: String {
      return mediaType ?? id.uuidString
    }
  }
}

class ImagePickerViewModel: ObservableObject {
  let sourceType: UIImagePickerController.SourceType
  let mediaTypes: [String]
  let callback: (Media?) -> Void

  init(sourceType: UIImagePickerController.SourceType = .photoLibrary,
       mediaTypes: [String] = UIImagePickerController.availableMediaTypes(for: .photoLibrary).unwrapped,
       callback: @escaping (Media?) -> Void) {
    self.mediaTypes = mediaTypes
    self.sourceType = sourceType
    self.callback = callback
  }
}
