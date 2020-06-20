//
//  SetGame.swift
//
//  Created by Scott Dodge on 5/24/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var score = 0

//    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
//        get { deck.indices.filter { deck[$0].isFaceUp }.only }
//        set {
//            for index in deck.indices {
//                deck[index].isFaceUp = index == newValue
//            }
//        }
//    }
    
    mutating func choose(card: Card) {
//        if let chosenIndex: Int = deck.fistIndex(matching: card), !deck[chosenIndex].isFaceUp, !deck[chosenIndex].isMatched {
//            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
//                if deck[chosenIndex].content == deck[potentialMatchIndex].content {
//                    deck[chosenIndex].isMatched = true
//                    deck[potentialMatchIndex].isMatched = true
//                    if secondsSinceLastFlip < 10 {
//                        score += (10 - secondsSinceLastFlip)
//                    } else {
//                        score += 1
//                    }
//                } else {
//                    score -= 1
//                }
//                self.deck[chosenIndex].isFaceUp = true
//                lastCardFlippedAt = Date()
//            } else {
//                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
//            }
//        }
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
        
        enum ShapeCount: Int, CaseIterable {
            case one = 1
            case two = 2
            case three = 3
        }

        enum Shape: String, CaseIterable {
            case diamond = "♦️"
            case squiggle = "➰"
            case oval = "🔵"
        }

        enum Shading: CaseIterable {
            case solid
            case striped
            case open
        }
        
        enum Color: CaseIterable {
            case red
            case green
            case purple
        }
    }
}
