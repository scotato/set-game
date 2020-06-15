//
//  Array+Only.swift
//  Memorize
//
//  Created by Scott Dodge on 6/6/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
