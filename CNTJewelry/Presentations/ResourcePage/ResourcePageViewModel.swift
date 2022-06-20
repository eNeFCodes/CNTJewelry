//
//  ResourcePageViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation

class ResourcePageViewModel: ObservableObject {
  let titleModel: ResourcePageTitleViewModel
  let tagsModel: TagViewModel
  let reportsModel: [ResourceReportViewModel]

  init(titleModel: ResourcePageTitleViewModel, tagsModel: TagViewModel, reportsModel: [ResourceReportViewModel] = []) {
    self.titleModel = titleModel
    self.tagsModel = tagsModel
    self.reportsModel = reportsModel
  }
}
