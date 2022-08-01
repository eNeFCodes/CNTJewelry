//
//  InAppBrowserView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 8/1/22.
//

import SwiftUI

struct InAppBrowserView: View {
  @Environment(\.presentationMode) private var presentationMode

  private let title: String
  private let url: URL

  init(title: String = "", url: URL) {
    self.title = title
    self.url = url
  }

  var body: some View {
    GeometryReader { geometry in
      VStack {
        buildTopNavigationViewStack(geometry: geometry)
        buildContentViewStack(geometry: geometry)
      }
      .frame(width: geometry.size.width, alignment: .top)
    }
    .ignoresSafeArea()
    .background(ColorCollection.black)
  }

  private func buildTopNavigationViewStack(geometry: GeometryProxy) -> some View {
    HStack {
      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Image("ic_arrow_left_white")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 44, height: 21, alignment: .leading)
      }
      Spacer(minLength: 0)
      Text(title)
        .accessibilityLabel(title)
        .foregroundColor(ColorCollection.white)
        .font(FontCollection.BrilliantCutProB7.medium(size: 18).font)
        .minimumScaleFactor(0.5)
      Spacer(minLength: 0)
      Button {
        print("BOOKMARK TAPPED!")
      } label: {
        Image("ic_nav_bookmark_white")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 32, height: 32, alignment: .leading)
      }
    }
    .padding(.horizontal, 32)
    .padding(.top, 32)
    .frame(width: geometry.size.width, height: 77, alignment: .leading)
    .background(ColorCollection.black)
  }

  private func buildContentViewStack(geometry: GeometryProxy) -> some View {
    VStack {
      ColorCollection.white
    }
    .frame(width: geometry.size.width, alignment: .center)
    .background(ColorCollection.white)
  }
}

struct InAppBrowser_Previews: PreviewProvider {
  static var previews: some View {
    InAppBrowserView(title: "Browser", url: URL(string: "https://github.com/eNeFCodes")!)
  }
}
