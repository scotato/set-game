//
//  Feature.swift
//  Set Game
//
//  Created by Scott Dodge on 6/21/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import SwiftUI

struct Feature: View {
    var shape: Shape
    var shading: Shading
    var color: Color
    
    enum Shape: String, CaseIterable, Hashable {
        case diamond
        case squiggle
        case oval
    }

    enum Shading: String, CaseIterable, Hashable {
        case solid
        case striped
        case open
    }
    
    enum Color: String, CaseIterable, Hashable {
        case red
        case green
        case purple
    }
    
    init(_ card: SetGame.Card) {
        shape = card.shape
        shading = card.shading
        color = card.color
    }
    
    init(shape: Shape, shading: Shading, color: Color) {
        self.shape = shape
        self.shading = shading
        self.color = color
    }
    
    var body: some View {
        shapeView()
    }
    
    func shapeView() -> some View {
        switch shape {
        case .diamond: return AnyView(diamondView())
        case .squiggle: return AnyView(squiggleView())
        case .oval: return AnyView(ovalView())
        }
    }
    
    func diamondView() -> some View {
        switch shading {
            case .solid:
                return AnyView(
                    Diamond().fill(shapeColor)
                )
            case .striped:
                return AnyView(
                    ZStack {
                        Stripes()
                            .stroke(shapeColor, lineWidth: 2)
                            .clipShape(Diamond())
                        Diamond().stroke(shapeColor, lineWidth: 2)
                    }
                    
                )
            case .open:
                return AnyView(
                    Diamond().stroke(shapeColor, lineWidth: 2)
                )
        }
    }
    
    func squiggleView() -> some View {
        switch shading {
            case .solid:
                return AnyView(
                    Squiggle().fill(shapeColor)
                )
            case .striped:
                return AnyView(
                    ZStack {
                        Stripes()
                            .stroke(shapeColor, lineWidth: 2)
                            .clipShape(Squiggle())
                        Squiggle().stroke(shapeColor, lineWidth: 2)
                    }
                    
                )
            case .open:
                return AnyView(
                    Squiggle().stroke(shapeColor, lineWidth: 2)
                )
        }
    }
    
    func ovalView() -> some View {
        switch shading {
            case .solid:
                return AnyView(
                    Oval().fill(shapeColor)
                )
            case .striped:
                return AnyView(
                    ZStack {
                        Stripes()
                            .stroke(shapeColor, lineWidth: 2)
                            .clipShape(Oval())
                        Oval().stroke(shapeColor, lineWidth: 2)
                    }
                    
                )
            case .open:
                return AnyView(
                    Oval().stroke(shapeColor, lineWidth: 2)
                )
        }
    }
    
    var shapeColor: SwiftUI.Color {
        switch color {
        case .red:
            return SwiftUI.Color.red
        case .green:
            return SwiftUI.Color.green
        case .purple:
            return SwiftUI.Color.purple
        }
    }
}

struct Feature_Previews: PreviewProvider {
    static var previews: some View {
        Feature(shape: .diamond, shading: .striped, color: .green)
    }
}
