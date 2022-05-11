//
//  DotView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct DotView: View {
    var model: DotViewModel
    let geometry: GeometryProxy

    var body: some View {
        HStack {
            if model.activeIndex == model.range.last {
                Button(action: model.action, label: {
                    let frameWidth = abs(geometry.size.width - (model.padding * 2))
                    let font = FontCollection.FancyCutCondProB7.bold(size: 20).font

                    Text(model.actionTitle)
                        .accessibilityLabel(model.actionTitle)
                        .font(font)
                        .foregroundColor(model.actionTitleColor)
                        .background(model.actionBGColor)
                        .frame(width: frameWidth, height: 56, alignment: .center)
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
        .frame(width: geometry.size.width, height: 56, alignment: .center)
    }

    private func dotIndicator(index: Int) -> some View {
        Button("") {
            model.activeIndex = index
        }
        .foregroundColor(.clear)
        .frame(width: 15, height: 15, alignment: .center)
        .overlay {
            Circle()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(model.dotInactiveColor)
                .overlay {
                    let rect = CGRect(x: 0, y: 0, width: 15, height: 15)
                    let roundPath = Path(roundedRect: rect, cornerRadius: 7.5, style: .continuous)
                    ShapeView(path: roundPath)
                        .stroke(model.dotInactiveStrokeColor, lineWidth: 2)
                }
        }
    }

    private func activeDotIndicator(index: Int) -> some View {
        Button("") {
            model.activeIndex = index
        }
        .foregroundColor(.clear)
        .frame(width: 15, height: 15, alignment: .center)
        .overlay {
            Circle()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(model.dotColor)
                .overlay {
                    let rect = CGRect(x: 0, y: 0, width: 15, height: 15)
                    let roundPath = Path(roundedRect: rect, cornerRadius: 7.5, style: .continuous)
                    ShapeView(path: roundPath)
                        .stroke(model.dotStrokeColor, lineWidth: 2)
                }
        }
    }
}

struct DotView_Previews: PreviewProvider {
    @State static var activeIndex: Int = 0
    static var previews: some View {
        GeometryReader { geometry in
            let model = DotViewModel(range: .init(0...3), activeIndex: $activeIndex) {

            }
            DotView(model: model, geometry: geometry)
        }
        .background(ColorCollection.black)
    }
}
