//
//  TextView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/8/22.
//

import Combine
import Foundation
import SwiftUI
import UIKit

struct TextView: UIViewRepresentable {
  typealias UIViewType = UITextView

  @Binding private var text: String
  private var cancellable: AnyCancellable?
  @StateObject private var model: TextViewModel

  init(text: Binding<String> = .constant(""),
       model: TextViewModel) {
    _text = text
    _model = .init(wrappedValue: model)
  }

  init(text: String = "",
       model: TextViewModel) {
    _text = .constant(text)
    _model = .init(wrappedValue: model)
  }
  
  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.backgroundColor = .clear

    textView.text = text
    textView.font = model.font
    textView.textColor = model.textColor
    textView.textAlignment = model.textAlignment
    textView.isSelectable = model.isSelectable
    textView.isEditable = model.isEditable
    textView.textContainer.exclusionPaths = model.exclusionPaths
    textView.delegate = context.coordinator

    textView.autocorrectionType = model.autocorrectionType
    textView.autocapitalizationType = model.autocapitalizationType

    return textView
  }

  func updateUIView(_ uiView: UITextView, context: Context) {

  }

  func makeCoordinator() -> TextViewCoordinator {
    TextViewCoordinator(text: $text, model: model)
  }
}

struct TextView_Previews: PreviewProvider {
  struct ArticleText {
    let fullText: String

    var initialText: String {
      String(fullText[...fullText.startIndex])
    }

    var bodyText: String {
      String(fullText[fullText.index(after: fullText.startIndex)...])
    }
  }

  static let padding: CGFloat = 32
  static let article: ArticleText = .init(fullText: "The Mainson’s registers from 1924 make the first mention of a ring consisting of three inseparably interlaced bands, each made of a different metal: platinum, pink gold and yellow. A bracelet with han identical concept was also created the same year. The clean-lined design appealed to Elsie de Wolfe, famouse American interior designer, who would be the first to purchase one.\n\nNews combinations of colors were introduced over the years. While the most emblematic joined yellow, pinka nd white gold, Cartier also dared to introduce audacious hues, such as green gold.")
  
  static var previews: some View {
    GeometryReader { geometry in
      let initialFont = FontCollection.FancyCutProB7.regular(size: 140).font
      let bodyFont = FontCollection.FancyCutProB7.regular(size: 18).uiFont
      let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 93, height: 100))
      TextView(text: article.bodyText,
               model: .init(font: bodyFont,
                            exclusionPaths: [path]))
      .padding(.horizontal, padding)
      .background(.orange)
      .overlay {
        GeometryReader { geometry in
          HStack {
            Text(article.initialText)
              .font(initialFont)
              .foregroundColor(.green)
              .frame(width: 93, height: 120, alignment: .center)
          }
          .padding(.horizontal, padding)
          .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
      }
    }
  }
}
