//
//  Foreground.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/3/31.
//

import SwiftUI

public extension View {
    func foregroundStyle(stColor: STAsset.ColorPalette?) -> some View {
        foregroundStyle(Color(stColor?.color ?? .clear))
    }
}

public extension Text {
    func foregroundStyle(stColor: STAsset.ColorPalette?) -> Text {
        foregroundStyle(Color(stColor?.color ?? .clear))
    }
}

#Preview {
    VStack {
        Text("Test").foregroundStyle(stColor: .brandDefault)
    }
}
