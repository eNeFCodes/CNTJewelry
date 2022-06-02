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
    GeometryReader { geometry in
      WeeklyCollectionHeaderItemView(model: model.header)
      LazyVStack(spacing: 0) {
        ForEach(model.items, id: \.viewId) { item in
          viewForContentType(item: item, geometry: geometry)
        }
      }
      .padding(.top, 116)
    }
    .frame(alignment: .top)
  }

  @ViewBuilder
  private func viewForContentType(item: WeeklyCollectionItemModelProtocol, geometry: GeometryProxy) -> some View {
    if item.type == .variant1, let model = item as? WeeklyCollectionItemViewModel {
      WeeklyCollectionItemView(model: model, geometry: geometry)
    } else if item.type == .variant2 {

    } else if item.type == .variant3, let model = item as? WeeklyCollectionItemV3ViewModel {
      WeeklyCollectionItemV3View(model: model, geometry: geometry)
    }
  }
}

struct WeeklyCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    WeeklyCollectionView(model: .init(header: .init(title: "This week\naround CNT".uppercased()),
                                      items: WeeklyCollectionViewModel.mockItems()))
  }
}
