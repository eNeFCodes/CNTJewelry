//
//  ProductDetailsViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/15/22.
//

import Foundation

extension ProductDetailsViewModel {
  struct Details: Identifiable {
    let id: Int
    let title: String
    let detail: String
    let copyright: String

    var number: String {
      id > 9 ? "\(id)" : "0\(id)"
    }

    init(id: Int, title: String = "", detail: String, copyright: String = "") {
      self.id = id
      self.title = title
      self.detail = detail
      self.copyright = copyright
    }
  }
}

struct ProductDetailsViewModel {
  let aboutIntro: String
  let aboutTitle: String
  let productImage: String
  let aboutDetails: [Details]

  var aboutDetailsCount: String {
    aboutDetails.count > 9 ? "\(aboutDetails.count)" : "0\(aboutDetails.count)"
  }

  init(aboutIntro: String = "",
       aboutTitle: String = "",
       productImage: String,
       aboutDetails: [Details]) {
    
    self.aboutIntro = aboutIntro
    self.aboutTitle = aboutTitle
    self.productImage = productImage
    self.aboutDetails = aboutDetails
  }
}
