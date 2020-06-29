//
//  Cardify.swift
//  Memorize
//
//  Created by Scott Dodge on 6/8/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    var isActive: Bool
    var size: CGSize
    var square: CGFloat { min(size.width, size.height) }

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).fill(self.isActive ? Color.green : Color.blue)
                content
                    .padding(.leading, cornerRadius * 1.5)
                    .padding(.trailing, cornerRadius * 1.5)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
            .frame(width: square, height: square)
    }
    
    // MARK: - Drawing Constants
    private var sizeMax: CGFloat { max(size.width, size.height) }
    private var cornerRadius: CGFloat { sizeMax / 10 }
    private var edgeLineWidth: CGFloat { sizeMax / 30 }
    private let aspectRatio: CGFloat = 1.2
}

extension View {
    func cardify(isFaceUp: Bool, isActive: Bool, size: CGSize) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isActive: isActive, size: size))
    }
}

struct Cardify_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        //game.deal(cards: 3)
        return SetGameView(viewModel: game)
    }
}
