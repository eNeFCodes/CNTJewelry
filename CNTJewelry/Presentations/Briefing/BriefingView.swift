//
//  BriefingView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/31/22.
//

import SwiftUI

struct BriefingView: View {
  @StateObject private var model: BriefingViewModel

  init(model: BriefingViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct BriefingView_Previews: PreviewProvider {
  static var previews: some View {
    BriefingView(model: .init())
  }
}
