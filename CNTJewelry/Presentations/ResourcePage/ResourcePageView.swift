//
//  ResourcePageView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import SwiftUI

struct ResourcePageView: View {
  @StateObject private var model: ResourcePageViewModel
  private let navModel: ResourceNavigationViewModel

  init(model: ResourcePageViewModel) {
    _model = .init(wrappedValue: model)
    self.navModel  = .init(title: "CNT",
                           subTitle: "JEWELRY")
  }

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical, showsIndicators: false) {
        LazyVStack(spacing: 40) {
          ResourcePageTitleView(model: model.titleModel,
                                geometry: geometry)

          TagView(model: model.tagsModel,
                  geometry: geometry)

          buildReportsViewStack(geometry: geometry)
        }
      }
      .padding(.top, 50)

      VStack {
        ResourceNavigationView(model: navModel,
                               geometry: geometry)
      }
      .padding(.top, 50)
      .background(ColorCollection.lightBeige100)
    }
    .ignoresSafeArea()
    .frame(alignment: .top)
    .navigationBarHidden(true)
  }

  private func buildReportsViewStack(geometry: GeometryProxy) -> some View {
    LazyVStack(spacing: 40) {
      ForEach(model.reportsModel, id: \.id) { model in
        ResourceReportView(model: model,
                           geometry: geometry)
      }
    }
  }
}

struct ResourcePageView_Previews: PreviewProvider {
  static var previews: some View {
    ResourcePageView(model: ResourcePageViewModel.mockData())
  }
}
