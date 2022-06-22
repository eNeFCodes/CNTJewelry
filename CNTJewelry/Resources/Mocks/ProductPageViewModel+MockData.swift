//
//  ProductPageViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/22/22.
//

import Foundation

extension ProductPageViewModel {
  class func mockData() -> ProductPageViewModel {
    .init(productCollection: ProductCollectionViewModel.mockData(),
          productDetails: ProductDetailsViewModel.mockData2())
  }
}
