//
//  FontModifier.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/2/27.
//

import SwiftUI

struct STFontModifier: ViewModifier {
    let size: CGFloat
    let weight: UIFont.Weight
    let isSingleLine: Bool
    let lineHeight: CGFloat

    init(
        size: CGFloat,
        weight: UIFont.Weight,
        isSingleLine: Bool,
        lineHeight: CGFloat
    ) {
        self.size = size
        self.weight = weight
        self.isSingleLine = isSingleLine
        self.lineHeight = lineHeight
    }
    
    func body(content: Content) -> some View {
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        return content.font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .lineLimit(isSingleLine ? 1 : .max)
            .padding(.vertical, isSingleLine ? 0 : (lineHeight - font.lineHeight) / 2)
            .fixedSize(horizontal: false, vertical: true)
    }
}

public extension View {
    func stTypography10Bold(isSingleLine: Bool = false) -> some View {
        modifier(
            STFontModifier(
                size: 10,
                weight: .bold,
                isSingleLine: isSingleLine,
                lineHeight: 18
            )
        )
    }
}
