//
//  String+Ext.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/15/22.
//

import Foundation
import UIKit

extension String {
  func constrainedSize(inCanvas canvas: CGSize, minWidth: CGFloat = 0, minHeight: CGFloat = 0, attributes: [NSAttributedString.Key: Any]) -> CGSize {
    let rectSize = self.boundingRect(with: canvas,
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     attributes: attributes,
                                     context: nil)
    let width = rectSize.width > minWidth ? rectSize.width : minWidth
    let height = rectSize.height > minHeight ? rectSize.height : minHeight
    return .init(width: width, height: height)
  }

  func constrainedSize(inCanvas canvas: CGSize, minHeight: CGFloat = 0, font: UIFont) -> CGFloat {
    let attributes: [NSAttributedString.Key: Any] = [.font: font]
    let rectSize = constrainedSize(inCanvas: canvas, minHeight: minHeight, attributes: attributes)
    return rectSize.height
  }
}
