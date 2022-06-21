//
//  ProductCollectionViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/21/22.
//

import Foundation

struct ProductCollectionViewModel {
  struct Media: Identifiable {
    let id: Int
    let image: String
  }

  struct SellingPoint: Identifiable {
    let id: Int
    let detail: String

    var number: String {
      id > 9 ? "\(id)" : "0\(id)"
    }
  }

  let miniTitle: String
  let title: String
  let edition: String
  let images: [Media]
  let detail: String

  let materials: String
  let globalPrice: String
  let reference: String
  let launchDate: String
  let sellingPointTitle: String
  let sellingPoints: [SellingPoint]

  var mediaCount: String {
    return images.count > 9 ? "\(images.count)" : "0\(images.count)"
  }

  init(miniTitle: String,
       title: String,
       edition: String,
       images: [Media],
       detail: String,

       materials: String,
       globalPrice: String,
       reference: String,
       launchDate: String,
       sellingPointTitle: String = L10n.Product.Collection.keySellingPoint,
       sellingPoints: [SellingPoint]) {

    self.miniTitle = miniTitle
    self.title = title
    self.edition = edition
    self.images = images
    self.detail = detail

    self.materials = materials
    self.globalPrice = globalPrice
    self.reference = reference
    self.launchDate = launchDate
    self.sellingPointTitle = sellingPointTitle
    self.sellingPoints = sellingPoints
  }
}
