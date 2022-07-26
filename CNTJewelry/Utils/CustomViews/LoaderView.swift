//
//  LoaderView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/27/22.
//

import SwiftUI

struct LoaderView: View {
  var body: some View {
    ZStack {
      Color.black
        .opacity(0.8)
        .blur(radius: 3)
      
      VStack {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle(tint: ColorCollection.accentColor))
      }
      .frame(width: 150, height: 150, alignment: .center)
      .background(ColorCollection.loader.opacity(0.7))
      .cornerRadius(20)
    }
    .ignoresSafeArea()
  }
}

struct LoaderView_Previews: PreviewProvider {
  @State static var isLoading: Bool = true
  static var previews: some View {
    LoaderView()
  }
}
