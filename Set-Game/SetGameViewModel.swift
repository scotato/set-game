//
//  SetGameViewModel.swift
//  Memorize
//
//  Created by Scott Dodge on 5/24/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var model: SetGame = SetGame()

    // MARK: Access to the Model
    
    var deck: Array<SetGame.Card> {
        model.deck
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: Intents
    
    func select(card: SetGame.Card) {
        model.select(card: card)
    }

    func reset() {
        model = SetGame()
    }
}
