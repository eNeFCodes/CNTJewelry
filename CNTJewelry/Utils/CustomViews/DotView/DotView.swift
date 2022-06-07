//
//  DotView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct DotView: View {
  let model: DotViewModel
  let contentWidth: CGFloat

  init(model: DotViewModel, contentWidth: CGFloat) {
    self.model = model
    self.contentWidth = contentWidth
  }

  var body: some View {
    HStack {
      if model.activeIndex == model.range.last {
        Button(action: model.action, label: {
          let frameWidth = abs(contentWidth - (model.padding * 2))
          let titleFont = FontCollection.BrilliantCutProB7.bold(size: 12).font

          Text(model.actionTitle)
            .accessibilityLabel(model.actionTitle)
            .font(titleFont)
            .foregroundColor(model.actionTitleColor)
            .frame(width: frameWidth, height: 56, alignment: .center)
            .background(model.actionBGColor)
            .clipped()
        })
      } else {
        ForEach(model.range, id: \.self) { idx in
          if model.activeIndex == idx {
            activeDotIndicator(index: idx)
          } else {
            dotIndicator(index: idx)
          }
        }
      }
    }
    .frame(width: contentWidth, height: 56, alignment: .center)
  }

  private func dotIndicator(index: Int) -> some View {
    Button {
      model.activeIndex = index
    } label: {
      Circle()
        .frame(width: 15, height: 15, alignment: .center)
        .foregroundColor(model.dotInactiveColor)
    }
    .frame(width: 15, height: 15, alignment: .center)
    .overlay {
      let rect = CGRect(x: 0, y: 0, width: 15, height: 15)
      let roundPath = Path(roundedRect: rect, cornerRadius: 7.5, style: .continuous)
      ShapeView(path: roundPath)
        .stroke(model.dotInactiveStrokeColor, lineWidth: 2)
    }
  }

  private func activeDotIndicator(index: Int) -> some View {
    Button {
      model.activeIndex = index
    } label: {
      Circle()
        .frame(width: 15, height: 15, alignment: .center)
        .foregroundColor(model.dotColor)
    }
    .frame(width: 15, height: 15, alignment: .center)
    .overlay {
      let rect = CGRect(x: 0, y: 0, width: 15, height: 15)
      let roundPath = Path(roundedRect: rect, cornerRadius: 7.5, style: .continuous)
      ShapeView(path: roundPath)
        .stroke(model.dotStrokeColor, lineWidth: 2)
    }
  }
}

struct DotView_Previews: PreviewProvider {
  @State static var activeIndex: Int = 3
  static var previews: some View {
    GeometryReader { geometry in
      let model = DotViewModel(range: .init(0...3), activeIndex: $activeIndex) {

      }
      DotView(model: model, contentWidth: geometry.size.width)
    }
    .background(ColorCollection.black)
  }
}
