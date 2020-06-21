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
            let shapeCounts = self.map { $0.shapeCount }
            let shapes = self.map { $0.shape }
            let shadings = self.map { $0.shading }
            let colors = self.map { $0.color }
            
            return sameOrDifferent(shapeCounts)
                && sameOrDifferent(shapes)
                && sameOrDifferent(shadings)
                && sameOrDifferent(colors)
        } else {
            return false
        }
    }

    func sameOrDifferent<Element: Hashable>(_ elements: [Element]) -> Bool {
        allSame(elements) || allDifferent(elements)
    }
    
    func allSame<Element: Hashable>(_ elements: [Element]) -> Bool {
        Set(elements).count == 1
    }
    
    func allDifferent<Element: Hashable>(_ elements: [Element]) -> Bool {
        Set(elements).count == elements.count
    }
}
