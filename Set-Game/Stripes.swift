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
        let stroke = max(rect.width, rect.height) / 30
        let spacer = CGFloat(stroke * 8)
        let lineCount = rect.width / (spacer - stroke)
        var p = Path()

        for index in 0..<Int(lineCount) {
            let x = index * Int(spacer)
            let top = CGPoint(x: x, y: 0)
            let bottom = CGPoint(x: x, y: Int(rect.height))
            
            p.move(to: top)
            p.addLine(to: bottom)
        }

        return p
    }
}

struct Stripes_Previews: PreviewProvider {
    static var previews: some View {
        Feature(shape: .squiggle, shading: .striped, color: .green)
    }
}
