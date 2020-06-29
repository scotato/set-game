//
//  SetGame.swift
//
//  Created by Scott Dodge on 5/24/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var score = 0

    public var playCards: Array<Card> {
        get { deck.filter { $0.isDealt && !$0.isMatched } }
    }
    
    private var selectedCards: Array<Card> {
        get { deck.filter { $0.isSelected } }
    }
    
    public var dealtCards: Array<Card> {
        get { deck.filter { $0.isDealt } }
    }
    
    public var undealtCards: Array<Card> {
        get { deck.filter { !$0.isDealt } }
    }
    
    public var matchedCards: Array<Card> {
        get { deck.filter { $0.isMatched } }
    }
    
    mutating func deal(cards: Int) {
        let cardsToDeal = undealtCards.count >= cards ? cards : undealtCards.count
        if cardsToDeal > 0 {
            for index in 0..<cardsToDeal {
                if let chosenIndex: Int = deck.fistIndex(matching: self.undealtCards[index]) {
                    self.deck[chosenIndex].isDealt = true
                }
            }
        }
    }

    mutating func matchSelected() {
        for card in selectedCards {
            if let chosenIndex: Int = deck.fistIndex(matching: card) {
                self.deck[chosenIndex].isMatched = true
                self.deck[chosenIndex].isSelected = false
            }
        }
    }
    
    mutating func deselectCards() {
        for card in selectedCards {
            if let chosenIndex: Int = deck.fistIndex(matching: card) {
                self.deck[chosenIndex].isSelected = false
            }
        }
    }
    
    mutating func select(card: Card) {
        if let chosenIndex: Int = deck.fistIndex(matching: card) {
            
            let isSelecting = !card.isSelected
            
            if isSelecting && selectedCards.count < 3 {
                self.deck[chosenIndex].isSelected = true
            } else if isSelecting {
                self.deselectCards()
                self.deck[chosenIndex].isSelected = true
            }
            
            if !isSelecting {
                self.deck[chosenIndex].isSelected = false
            }

            if selectedCards.isMatchedSet {
                self.matchSelected()
                self.deal(cards: 3)
                self.score += 1
            }
        }
    }
    
    init () {
        deck = Array<Card>()
        for shapeCount in Card.ShapeCount.allCases {
            for shape in Feature.Shape.allCases {
                for shading in Feature.Shading.allCases {
                    for color in Feature.Color.allCases {
                        deck.append(Card(
                            id: deck.count,
                            shapeCount: shapeCount,
                            shape: shape,
                            shading: shading,
                            color: color
                        ))
                    }
                }
            }
        }
        deck.shuffle()
        deal(cards: 12)
    }
    
    struct Card: Identifiable {
        let id: Int
        let shapeCount: ShapeCount
        let shape: Feature.Shape
        let shading: Feature.Shading
        let color: Feature.Color
        var isDealt: Bool = false
        var isMatched: Bool = false
        var isSelected: Bool = false
        
        enum ShapeCount: Int, CaseIterable, Hashable {
            case one = 1
            case two = 2
            case three = 3
        }
    }
}
