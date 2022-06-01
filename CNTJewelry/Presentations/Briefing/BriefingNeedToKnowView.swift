//
//  BriefingNeedToKnowView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/1/22.
//

import SwiftUI

struct BriefingNeedToKnowView: View {
  @StateObject private var model: BriefingNeedToKnowViewModel
  
  init(model: BriefingNeedToKnowViewModel) {
    _model = .init(wrappedValue: model)
  }
  
  var body: some View {
    Text("Hello, World!")
  }
}

struct BriefingNeedToKnowView_Previews: PreviewProvider {
  static var previews: some View {
    BriefingNeedToKnowView(model: .init())
  }
}
