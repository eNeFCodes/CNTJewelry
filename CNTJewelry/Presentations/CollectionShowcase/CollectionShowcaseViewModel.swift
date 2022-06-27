//
//  CollectionShowcaseViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/17/22.
//

import Foundation

struct CollectionShowcaseViewModel {
  let miniTitle: String
  let title: String
  let details: String

  let productImage: String
  let productThumb: String
}

extension CollectionShowcaseViewModel {
  func viewCollectionAction() {
    print("viewCollectionAction...")
  }
}
