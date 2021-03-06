//
//  BriefingBottomNavigationView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/31/22.
//

import SwiftUI

struct BriefingBottomNavigationView: View {
  @ObservedObject private var model: BriefingBottomNavigationViewModel

  init(model: BriefingBottomNavigationViewModel) {
    self.model = model
  }

  var body: some View {
    HStack {
      ForEach(model.buttons, id: \.id) { item in
        NavigationButtonItem(model: item)
      }
    }
  }
}

struct BriefingBottomNavigationView_Previews: PreviewProvider {
  static var previews: some View {
    BriefingBottomNavigationView(model: .init(buttons: BriefingBottomNavigationViewModel.navigationButtons()))
  }
}
