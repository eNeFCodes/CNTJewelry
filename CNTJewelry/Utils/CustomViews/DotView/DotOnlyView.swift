//
//  DotOnlyView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct DotOnlyView: View {

    var model: DotOnlyViewModel
    let geometry: GeometryProxy
    
    var body: some View {
        HStack {
            ForEach(model.range, id: \.self) { idx in
                if model.activeIndex == idx {
                    activeDotIndicator(index: idx)
                } else {
                    dotIndicator(index: idx)
                }
            }
        }
        .frame(width: geometry.size.width, height: 56, alignment: .center)
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


struct DotOnlyView_Previews: PreviewProvider {
    @State static var activeIndex: Int = 0
    static var previews: some View {
        GeometryReader { geometry in
            let model = DotOnlyViewModel(range: .init(0...3), activeIndex: $activeIndex)
            DotOnlyView(model: model, geometry: geometry)
                .background(ColorCollection.black)
        }
    }
}
