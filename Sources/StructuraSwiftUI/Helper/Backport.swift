//
//  BackPort.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/2/27.
//

import Foundation
import SwiftUI

public struct Backport<Object> {
    public let object: Object

    public init(_ object: Object) {
        self.object = object
    }
}

public extension View {
    var backport: Backport<Self> { Backport(self) }
}

public extension Backport where Object: View {
    @ViewBuilder
    func foregroundStyle(_ style: Color) -> some View {
        if #available(iOS 17.0, *) {
            object.foregroundStyle(style)
        } else {
            object.foregroundColor(style)
        }
    }
}
