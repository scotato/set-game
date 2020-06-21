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
            Grid(viewModel.deck) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.select(card: card)
                }
                .padding(5)
            }
                .padding()
                .font(viewModel.deck.count == 10 ? Font.headline : Font.largeTitle)
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
    var card: SetGame.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        VStack {
            Text(card.shapeCount.rawValue)
            Text(card.shape.rawValue)
            Text(card.shading.rawValue)
            Text(card.color.rawValue)
        }
        .font(Font.system(size: fontSize(for: size)))
        .background(card.isSelected ? Color.blue : Color.white)
    }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.2
    }
}

struct ContletView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
//        game.select(card: game.cards[0])
        return SetGameView(viewModel: game)
    }
}
