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

  @State private var isSearchPageActive: Bool = false
  @State private var isProfilePageActive: Bool = false
  @State private var isFavoritePageActive: Bool = false
  @State private var isLivePageActive: Bool = false
  @State private var isResourcePageActive: Bool = false
  @State private var isAddPageActive: Bool = false

  init(model: BriefingViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      BriefingTopNavigationView(model: topNavigationModel)



      VStack {
        Spacer()
        BriefingBottomNavigationView(model: botNavigationModel)
      }
      .frame(width: geometry.size.width, alignment: .center)
    }
    .onReceive(topNavigationModel.publisher) { action in
      switch action {
      case .search:
        isSearchPageActive = true
      case .profile:
        isProfilePageActive = true
      }
    }
  }
}

struct BriefingView_Previews: PreviewProvider {
  static var previews: some View {
    BriefingView(model: .init())
  }
}
