//
//  SetGame.swift
//
//  Created by Scott Dodge on 5/24/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.

import Foundation

struct SetGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    private var lastCardFlippedAt = Date()
    
    private var secondsSinceLastFlip: Int {
        Calendar.current.dateComponents([.second], from: lastCardFlippedAt, to: Date()).second!
    }
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    enum ShapeCount {
        case one
        case two
        case three
    }


    enum Shape {
        case diamond
        case squiggle
        case oval
    }

    enum Shading {
        case solid
        case striped
        case open
    }
    
    enum Color {
        case red
        case green
        case purple
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex: Int = cards.fistIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    if secondsSinceLastFlip < 10 {
                        score += (10 - secondsSinceLastFlip)
                    } else {
                        score += 1
                    }
                } else {
                    score -= 1
                }
                self.cards[chosenIndex].isFaceUp = true
                lastCardFlippedAt = Date()
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
