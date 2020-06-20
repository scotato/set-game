//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Scott Dodge on 6/6/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import Foundation

extension Array where Element : Identifiable {
    func fistIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
