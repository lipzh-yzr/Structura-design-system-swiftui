//
//  RoundedCorner.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/4/5.
//
import SwiftUI

public struct RoundedCorner: Shape {
    public let cornerRadius: CGFloat
    public let corners: UIRectCorner

    public init(cornerRadius: CGFloat, corners: UIRectCorner) {
        self.cornerRadius = cornerRadius
        self.corners = corners
    }

    nonisolated public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: .init(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
}

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(cornerRadius: radius, corners: corners))
    }
}
