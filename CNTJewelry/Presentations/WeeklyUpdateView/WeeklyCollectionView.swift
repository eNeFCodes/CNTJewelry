//
//  WeeklyCollectionView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import SwiftUI

struct WeeklyCollectionView: View {
  @ObservedObject private var model: WeeklyCollectionViewModel

  init(model: WeeklyCollectionViewModel) {
    self.model = model
  }

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct WeeklyCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    WeeklyCollectionView(model: .init(items: []))
  }
}
