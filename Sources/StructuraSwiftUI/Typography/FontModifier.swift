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
    
    func stTypography12Semibold(isSingleLine: Bool = false) -> some View {
        modifier(
            STFontModifier(
                size: 12,
                weight: .semibold,
                isSingleLine: isSingleLine,
                lineHeight: 16
            )
        )
    }
    
    func stTypography14Regular(isSingleLine: Bool = false) -> some View {
        modifier(
            STFontModifier(
                size: 14,
                weight: .regular,
                isSingleLine: isSingleLine,
                lineHeight: 19
            )
        )
    }
    
    func stTypography(
        size: CGFloat,
        weight: UIFont.Weight,
        isSingleLine: Bool = false,
        lineHeight: CGFloat
    ) -> some View {
        modifier(
            STFontModifier(
                size: size,
                weight: weight,
                isSingleLine: isSingleLine,
                lineHeight: lineHeight
            )
        )
    }
}
