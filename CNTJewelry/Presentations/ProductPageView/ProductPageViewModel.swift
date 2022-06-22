//
//  ProductPageViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/21/22.
//

import Foundation

class ProductPageViewModel: ObservableObject {
  let productCollection: ProductCollectionViewModel

  init(productCollection: ProductCollectionViewModel) {
    self.productCollection = productCollection
  }
}
