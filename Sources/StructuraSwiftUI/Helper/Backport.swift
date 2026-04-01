//
//  BackPort.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/2/27.
//

import Foundation
import SwiftUI

struct Backport<Object> {
    let object: Object
    init(_ object: Object) {
        self.object = object
    }
}

extension View {
    var backport: Backport<Self> { Backport(self) }
}

extension Backport where Object: View {
    @ViewBuilder
    func foregroundStyle(_ style: Color) -> some View {
        if #available(iOS 17.0, *) {
            object.foregroundStyle(style)
        } else {
            object.foregroundColor(style)
        }
    }
}
