//
//  ResourcePageViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation

//extension ResourcePageViewModel {
//  static func mockData() -> ResourcePageViewModel {
//    .init(titleModel: ResourcePageTitleViewModel.mockData(),
//          tagsModel: TagView.mockData(),
//          reportsModel: [
//            .init(id: 0,
//                  shortTitle: "RESOURCE TYPE",
//                  longTitle: "Repair Creation and Follow-up".uppercased(),
//                  message: "Nam ultrices dictum nunc at tempus. Praesent bibendum tellus tellus, quis fringilla quam convallis sed lorem ipsum longer sentence bla bla something else.",
//                  attachment: "PDF / 3.83 MB"),
//            .init(id: 1,
//                  shortTitle: "RESOURCE TYPE",
//                  longTitle: "COMMISSIONS TO INTERMEDIARIES".uppercased(),
//                  message: "Nam ultrices dictum nunc at tempus. Praesent bibendum tellus tellus, quis fringilla quam convallis sed lorem ipsum longer sentence bla bla something else."),
//            .init(id: 2,
//                  shortTitle: "RESOURCE TYPE",
//                  longTitle: "GUARANTEE AND AUTHENTICITY CERTIFICATES".uppercased(),
//                  message: "Nam ultrices dictum nunc at tempus. Praesent bibendum tellus tellus, quis fringilla quam convallis sed lorem ipsum longer sentence bla bla something else.",
//                  attachment: "PDF / 3.83 MB")
//          ])
//  }
//}

extension ResourcePageTitleViewModel {
  static func mockData() -> ResourcePageTitleViewModel {
    .init(title: "Life on the\nBoutique\nFloor".uppercased(),
          subTitle: "Resources".uppercased(),
          message: "Discover best practices, guides, how-to’s, and other resources")
  }
}

extension ResourceReportViewModel {
  static func mockData() -> ResourceReportViewModel {
    .init(id: 0,
          shortTitle: "RESOURCE TYPE",
          longTitle: "Repair Creation and Follow-up".uppercased(),
          message: "Nam ultrices dictum nunc at tempus. Praesent bibendum tellus tellus, quis fringilla quam convallis sed lorem ipsum longer sentence bla bla something else.",
          attachment: "PDF / 3.83 MB")
  }
}
