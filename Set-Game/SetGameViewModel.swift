//
//  SetGameViewModel.swift
//  Memorize
//
//  Created by Scott Dodge on 5/24/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var model: SetGame<String> = SetGameViewModel.createSetGame()

    private static func createSetGame() -> SetGame<String> {
        let sets = ["〽️", "💠", "🌀", "🔰", "💢", "〰️", "🔺", "🔸", "♦️"]
        let pairs = Int.random(in: 4..<sets.count)
        return SetGame<String>(numberOfPairsOfCards: pairs) { pairIndex in
            return sets[pairIndex]
        }
    }

    // MARK: Access to the Model
    
    var cards: Array<SetGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: Intents
    
    func choose(card: SetGame<String>.Card) {
        model.choose(card: card)
    }
    
    func reset() {
//        theme = themes.randomElement()!
        model = SetGameViewModel.createSetGame()
    }
}
