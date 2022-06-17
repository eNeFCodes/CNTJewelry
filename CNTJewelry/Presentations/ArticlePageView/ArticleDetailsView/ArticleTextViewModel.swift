//
//  ArticleTextViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import Foundation

extension ArticleTextViewModel {
  struct BulletedText {
    let id: UUID
    let page: Int // show when Bullet.addNumberToBullets
    let text: String

    init(page: Int = 0, text: String) {
      self.id = UUID()
      self.page = page
      self.text = text
    }
  }

  struct Bullet {
    let title: String
    let bulletedText: [BulletedText]
    let details: String?
    let addNumberToBullets: Bool

    init(title: String,
         bulletedText: [BulletedText],
         details: String? = nil,
         addNumberToBullets: Bool = false) {

      self.title = title
      self.bulletedText = bulletedText
      self.details = details
      self.addNumberToBullets = addNumberToBullets
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
