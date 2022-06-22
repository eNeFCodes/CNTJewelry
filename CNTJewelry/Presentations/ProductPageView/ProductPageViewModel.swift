//
//  ProductPageViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/21/22.
//

import Foundation

class ProductPageViewModel: ObservableObject {
  let productCollection: ProductCollectionViewModel
  let productDetails: ProductDetailsViewModel

  init(productCollection: ProductCollectionViewModel,
       productDetails: ProductDetailsViewModel) {
    self.productCollection = productCollection
    self.productDetails = productDetails
  }
}
