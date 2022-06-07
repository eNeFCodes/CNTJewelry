//
//  WeeklyCollectionViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation

extension WeeklyCollectionViewModel {
  class func mockItems() -> [WeeklyCollectionItemModelProtocol] {
    [
      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result1",
                                    date: "MAR 1, 2020"),

      WeeklyCollectionItemV2ViewModel(imageName: "img_ring",
                                      title: "TAKEAWAY",
                                      subTitle: "Congratulate\nMaria".uppercased(),
                                      details: "Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before. Its five-year mission: to explore strange new worlds again.",
                                      time: "5 mins ago".uppercased(),
                                      author: "Jane Doe",
                                      authorDetails: "Lorem Ispum Role",
                                      location: "5th Avenue Mansion"),

      WeeklyCollectionItemV3ViewModel(title: "EYEBROW",
                                      subTitle: "Biasas fsa Vehicula Etiam Egestas lorem ipsum".uppercased(),
                                      details: "Nam ultrices dictum nunc at tempus. Praesent bibendum tellus tellus, quis fringilla quam convallis sed lorem ipsum longer sentence bla bla something else.",
                                      date: "MAR 1, 2020")
    ]
  }

  class func mockItems2() -> [WeeklyCollectionItemModelProtocol] {
    [
      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result7",
                                    date: "MAR 1, 2020"),

      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result8",
                                    date: "MAR 1, 2020"),

      WeeklyCollectionItemV2ViewModel(imageName: "img_ring",
                                      title: "TAKEAWAY",
                                      subTitle: "Congratulate\nMaria".uppercased(),
                                      details: "Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before. Its five-year mission: to explore strange new worlds again.",
                                      time: "5 mins ago".uppercased(),
                                      author: "Jane Doe",
                                      authorDetails: "Lorem Ispum Role",
                                      location: "5th Avenue Mansion"),

      WeeklyCollectionItemV3ViewModel(title: "EYEBROW",
                                      subTitle: "Biasas fsa Vehicula Etiam Egestas lorem ipsum".uppercased(),
                                      details: "Nam ultrices dictum nunc at tempus. Praesent bibendum tellus tellus, quis fringilla quam convallis sed lorem ipsum longer sentence bla bla something else.",
                                      date: "MAR 1, 2020")
    ]
  }
}
