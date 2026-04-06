//
//  Background.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/3/31.
//

import SwiftUI

public extension View {
    func background(stColor: STAsset.ColorPalette) -> some View {
        background {
            Color(stColor.color)
        }
    }
}
