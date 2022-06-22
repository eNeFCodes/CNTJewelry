//
//  ProductPageView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/21/22.
//

import SwiftUI

struct ProductPageView: View {
  @StateObject private var model: ProductPageViewModel

  init(model: ProductPageViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        LazyVStack {
          ProductCollectionView(model: model.productCollection,
                                geometry: geometry)
        }
      }
    }
    .ignoresSafeArea()
  }
}

struct ProductPageView_Previews: PreviewProvider {
  static var previews: some View {
    ProductPageView(model: ProductPageViewModel.mockData())
  }
}
