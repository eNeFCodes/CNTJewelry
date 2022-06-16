//
//  TimeInterval+Ext.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import Foundation

extension TimeInterval {
  static let durationFormatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .dropAll
    return formatter
  }()

  var formattedDuration: String {
    let formatted = TimeInterval.durationFormatter.string(from: self) ?? "0"
    return "\(formatted) MIN"
  }
}
