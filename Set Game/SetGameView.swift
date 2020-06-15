//
//  SetGameView.swift
//  Memorize
//
//  Created by Scott Dodge on 5/20/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
                .padding()
                .font(viewModel.cards.count == 10 ? Font.headline : Font.largeTitle)
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Button(action: viewModel.reset) {
                    Text("New Game")
                }
                
            }
                .padding()
        }
        
    }
}

struct CardView: View {
    var card: SetGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
        }
    }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
}

struct ContletView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        game.choose(card: game.cards[0])
        return SetGameView(viewModel: game)
    }
}
