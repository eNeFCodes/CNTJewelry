//
//  ArticleTextViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import Foundation

extension ArticleTextViewModel {
  struct Bullet {
    let title: String
    let bulletedText: [String]
    let details: String

    init(title: String, bulletedText: [String], details: String = "") {
      self.title = title
      self.bulletedText = bulletedText
      self.details = details
    }
  }
}

struct ArticleTextViewModel {
  let title: String
  let details: String
  let bullet: Bullet?

  init(title: String, details: String, bullet: Bullet? = nil) {
    self.title = title
    self.details = details
    self.bullet = bullet
  }
}
