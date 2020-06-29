//
//  Feature.swift
//  Set Game
//
//  Created by Scott Dodge on 6/21/20.
//  Copyright © 2020 Scott Dodge. All rights reserved.
//

import SwiftUI

struct Feature: View {
    var size: CGSize
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
    
    init(_ card: SetGame.Card, size: CGSize) {
        self.size = size
        self.shape = card.shape
        self.shading = card.shading
        self.color = card.color
    }
    
    init(shape: Shape, shading: Shading, color: Color, size: CGSize = CGSize(width: 64, height: 64)) {
        self.shape = shape
        self.shading = shading
        self.color = color
        self.size = size
    }
    
    var body: some View {
        shapeView()
            .frame(height: size.height / 6)
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
                            .stroke(style: self.strokeStyle)
                            .fill(shapeColor)
                            .clipShape(Diamond())
                        Diamond()
                            .stroke(style: self.strokeStyle)
                            .fill(shapeColor)
                    }
                    
                )
            case .open:
                return AnyView(
                    Diamond().stroke(shapeColor, lineWidth: self.lineWidth)
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
                            .stroke(style: self.strokeStyle)
                            .fill(shapeColor)
                            .clipShape(Squiggle())
                        Squiggle()
                            .stroke(style: self.strokeStyle)
                            .fill(shapeColor)
                    }
                    
                )
            case .open:
                return AnyView(
                    Squiggle()
                        .stroke(style: self.strokeStyle)
                        .fill(shapeColor)
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
                            .stroke(shapeColor, lineWidth: self.lineWidth)
                            .clipShape(Oval())
                        Oval().stroke(shapeColor, lineWidth: self.lineWidth)
                    }
                    
                )
            case .open:
                return AnyView(
                    Oval().stroke(shapeColor, lineWidth: self.lineWidth)
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
    
    // MARK: - Drawing Constants
    private var sizeMax: CGFloat { max(size.width, size.height) }
    private var lineWidth: CGFloat { sizeMax / 30 }
    private var strokeStyle: StrokeStyle {
        StrokeStyle(
            lineWidth: lineWidth,
            lineCap: .round,
            lineJoin: .round,
            miterLimit: .greatestFiniteMagnitude,
            dash: [],
            dashPhase: 0
        )
    }
}

struct Feature_Previews: PreviewProvider {
    static var previews: some View {
        Feature(
            shape: .diamond,
            shading: .striped,
            color: .green,
            size:  CGSize(width: 512, height: 512)
        )
    }
}
