//
//  SafariWrapperView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 8/1/22.
//

import Foundation
import SafariServices
import UIKit
import SwiftUI

struct SafariWrapperViewModel {
  let url: URL
  let configuration: SFSafariViewController.Configuration
}

extension SafariWrapperViewModel {
  static let stub: SafariWrapperViewModel = {
    .init(url: URL(string: "https://github.com/eNeFCodes")!,
          configuration: .init())
  }()
}

struct SafariWrapperView: UIViewControllerRepresentable {
  typealias UIViewControllerType = SFSafariViewController

  private let model: SafariWrapperViewModel
  init(model: SafariWrapperViewModel) {
    self.model = model
  }

  func makeUIViewController(context: Context) -> SFSafariViewController {
    let safari = SFSafariViewController(url: model.url,
                                        configuration: model.configuration)
    return safari
  }

  func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

  }
}
