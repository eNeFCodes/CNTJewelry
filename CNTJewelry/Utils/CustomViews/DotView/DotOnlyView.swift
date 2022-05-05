//
//  DotOnlyView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct DotOnlyView: View {

    var model: DotOnlyViewModel

    var body: some View {
        HStack(alignment: .center) {
            ForEach(model.range, id: \.self) { idx in
                if model.activeIndex == idx {
                    activeDotIndicator(index: idx)
                } else {
                    dotIndicator(index: idx)
                }
            }
        }
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


struct DotOnlyView_Previews: PreviewProvider {
    @State static var activeIndex: Int = 0
    static var previews: some View {
        let model = DotOnlyViewModel(range: 0...3, activeIndex: $activeIndex)
        DotOnlyView(model: model)
    }
}
