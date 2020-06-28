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
            Grid(viewModel.playCards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.select(card: card)
                }
                .padding(5)
            }
                .padding()
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Button(action: { self.viewModel.deal(cards: 3) }) {
                    Text("Deal")
                }
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
            ForEach((1...card.shapeCount.rawValue), id: \.self) {_ in
                Feature(self.card)
                    .frame(height: size.height / 5)
            }
        }
            .padding()
            .frame(height: size.height)
            .background(RoundedRectangle(cornerRadius: 16.0).stroke(card.isSelected ? Color.green : Color.blue, lineWidth: 4))

    }
}

struct ContletView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        return SetGameView(viewModel: game)
    }
}
