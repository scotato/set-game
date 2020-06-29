//
//  Squiggle.swift
//  Set Game
//
//  Created by Scott Dodge on 6/21/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let topLeft = CGPoint(x: 0, y: 0)
        let topRight = CGPoint(x: rect.width, y: 0)
        let bottomLeft = CGPoint(x: 0, y: rect.height)
        let bottomRight = CGPoint(x: rect.width, y: rect.height)
        
        
        var p = Path()
        p.move(to: topLeft)
        p.addLine(to: bottomLeft)
        p.addLine(to: bottomRight)
        p.addLine(to: topRight)
        p.addLine(to: topLeft)
        p.closeSubpath()
        return p
    }
}

struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        Squiggle()
    }
}
