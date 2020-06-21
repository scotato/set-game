//
//  Array+SetMatch.swift
//  Set Game
//
//  Created by Scott Dodge on 6/21/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import Foundation

extension Array where Element == SetGame.Card {
    var isMatchedSet: Bool {
        if self.count == 3 {
            return sameOrDifferent(self.map { $0.shapeCount })
                && sameOrDifferent(self.map { $0.shape })
                && sameOrDifferent(self.map { $0.shading })
                && sameOrDifferent(self.map { $0.color })
        } else {
            return false
        }
    }

    private func sameOrDifferent<Element: Hashable>(_ elements: [Element]) -> Bool {
        allSame(elements) || allDifferent(elements)
    }
    
    private func allSame<Element: Hashable>(_ elements: [Element]) -> Bool {
        Set(elements).count == 1
    }
    
    private func allDifferent<Element: Hashable>(_ elements: [Element]) -> Bool {
        Set(elements).count == elements.count
    }
}
