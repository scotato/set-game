//
//  Diamond.swift
//  Set Game
//
//  Created by Scott Dodge on 6/21/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let centerTop = CGPoint(x: rect.midX, y: 0)
        let centerBottom = CGPoint(x: rect.midX, y: rect.height)
        let middleLeft = CGPoint(x: 0, y: rect.midY)
        let middleRight = CGPoint(x: rect.width, y: rect.midY)
        
        
        var p = Path()
        p.move(to: centerTop)
        p.addLine(to: middleLeft)
        p.addLine(to: centerBottom)
        p.addLine(to: middleRight)
        p.addLine(to: centerTop)
        p.closeSubpath()
        return p
    }
}
