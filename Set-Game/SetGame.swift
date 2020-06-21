//
//  SetGame.swift
//
//  Created by Scott Dodge on 5/24/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var score = 0

    private var selectedCards: Array<Card> {
        get { deck.filter { $0.isSelected } }
    }
    
    mutating func select(card: Card) {
        if let chosenIndex: Int = deck.fistIndex(matching: card) {
            
            let isSelecting = !card.isSelected
            
            if isSelecting && selectedCards.count < 3 {
                self.deck[chosenIndex].isSelected = true
            }
            
            if !isSelecting {
                self.deck[chosenIndex].isSelected = false
            }
            
            print("match", selectedCards.isMatchedSet)
        }
    }
    
    init () {
        deck = Array<Card>()
        for shapeCount in Card.ShapeCount.allCases {
            for shape in Card.Shape.allCases {
                for shading in Card.Shading.allCases {
                    for color in Card.Color.allCases {
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
    }
    
    struct Card: Identifiable {
        let id: Int
        let shapeCount: ShapeCount
        let shape: Shape
        let shading: Shading
        let color: Color
        var isSelected: Bool = false
        var isMatched: Bool = false
        
        enum ShapeCount: String, CaseIterable, Equatable, Hashable {
            case one
            case two
            case three
        }

        enum Shape: String, CaseIterable, Equatable, Hashable {
            case diamond
            case squiggle
            case oval
        }

        enum Shading: String, CaseIterable, Equatable, Hashable {
            case solid
            case striped
            case open
        }
        
        enum Color: String, CaseIterable, Equatable, Hashable {
            case red
            case green
            case purple
        }
    }
}
