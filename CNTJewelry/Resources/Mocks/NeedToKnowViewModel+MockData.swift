//
//  NeedToKnowViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

extension NeedToKnowViewModel {
  class func knowTos() -> [NeedToKnowInfo] {
    [
      .init(id: 0,
            title: "1 here are the key things you need to know today!".uppercased(),
            message: "Swipe left to get started".uppercased(),
            icon: "ic_knowTo1"),
      .init(id: 1,
            title: "2 here are the key things you need to know today!".uppercased(),
            message: "Swipe left to get started".uppercased(),
            icon: "ic_knowTo1"),
      .init(id: 3,
            title: "3 here are the key things you need to know today!".uppercased(),
            message: "Swipe left to get started".uppercased(),
            icon: "ic_knowTo1"),
      .init(id: 4,
            title: "4 here are the key things you need to know today!".uppercased(),
            message: "Swipe left to get started".uppercased(),
            icon: "ic_knowTo1"),
      .init(id: 5,
            title: "5 here are the key things you need to know today!".uppercased(),
            message: "Swipe left to get started".uppercased(),
            icon: "ic_knowTo1")
    ]
  }
}
