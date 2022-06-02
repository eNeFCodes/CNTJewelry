//
//  BriefingView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/31/22.
//

import SwiftUI

struct BriefingView: View {
  @StateObject private var model: BriefingViewModel
  @StateObject private var topNavigationModel: BriefingTopNavigationViewModel = {
    .init(title: "CNT", subTitle: "JEWELRY")
  }()
  @StateObject private var botNavigationModel: BriefingBottomNavigationViewModel = {
    .init(buttons: BriefingBottomNavigationViewModel.navigationButtons())
  }()

  @StateObject private var needToKnowModel: NeedToKnowViewModel

  @State private var isSearchPageActive: Bool = false
  @State private var isProfilePageActive: Bool = false
  @State private var isFavoritePageActive: Bool = false
  @State private var isLivePageActive: Bool = false
  @State private var isResourcePageActive: Bool = false
  @State private var isAddPageActive: Bool = false

  init(model: BriefingViewModel, needToKnowModel: NeedToKnowViewModel) {
    _model = .init(wrappedValue: model)
    _needToKnowModel = .init(wrappedValue: needToKnowModel)
  }

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical, showsIndicators: false) {
        LazyVStack(spacing: 24) {
          buildBonjurViewStack(geometry: geometry)
            .padding(.top, 26)

          NeedToKnowView(model: needToKnowModel)

          buildBonjurViewStack(geometry: geometry)
        }
      }
      .padding(.top, 54)

      VStack {
        BriefingTopNavigationView(model: topNavigationModel)
        Spacer()
      }

      VStack {
        Spacer()
        BriefingBottomNavigationView(model: botNavigationModel)
      }
      .frame(width: geometry.size.width, alignment: .center)
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .onReceive(topNavigationModel.publisher) { action in
      switch action {
      case .search:
        isSearchPageActive = true
      case .profile:
        isProfilePageActive = true
      }
    }
  }

  @ViewBuilder
  private func buildBonjurViewStack(geometry: GeometryProxy) -> some View {
    let padding: CGFloat = 32
    VStack(spacing: 8) {
      let textContentWidth = abs(geometry.size.width - (padding * 2))
      let dateFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.regular(size: 11))
      Text(model.bonjurDate)
        .accessibilityLabel(model.bonjurDate)
        .font(dateFont)
        .frame(width: textContentWidth, alignment: .leading)

      let bonjurFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 28))
      Text(model.bonjurTitle)
        .accessibilityLabel(model.bonjurTitle)
        .font(bonjurFont)
        .frame(width: textContentWidth, alignment: .leading)
    }
    .foregroundColor(ColorCollection.black)
    .padding(.horizontal, padding)
    .frame(width: abs(geometry.size.width), alignment: .leading)
  }
}

struct BriefingView_Previews: PreviewProvider {
  static var previews: some View {
    BriefingView(model: .init(bonjurDate: "Monday, Nov 18, 2019",
                              bonjurTitle: "Bonjour,\nJean!".uppercased()),
                 needToKnowModel: .init(title: "YOUR BOUTIQUE",
                                        knowTos: NeedToKnowViewModel.knowTos()))
  }
}
