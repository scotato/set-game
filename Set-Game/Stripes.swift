//
//  Stripes.swift
//  Set Game
//
//  Created by Scott Dodge on 6/21/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import SwiftUI

struct Stripes: Shape {
    func path(in rect: CGRect) -> Path {
        let stroke = 2
        let spacer = stroke * 4
        let lineCount = Int(rect.width) / (spacer - stroke)
        var p = Path()

        for index in 0..<lineCount {
            let x = index * spacer
            let top = CGPoint(x: x, y: 0)
            let bottom = CGPoint(x: x, y: Int(rect.height))
            
            p.move(to: top)
            p.addLine(to: bottom)
        }

        return p
    }
}
