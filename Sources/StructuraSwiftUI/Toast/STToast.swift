//
//  STToast.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/2/27.
//

import SwiftUI

public struct STToast: View {
    public let item: STToastItem
    public let onDismiss: () -> Void
    @State var timer: Timer?
    @State var isPresented = false

    public init(item: STToastItem, onDismiss: @escaping () -> Void = {}) {
        self.item = item
        self.onDismiss = onDismiss
    }

    public var body: some View {
        let style = item.type.style
        VStack(alignment: .center, spacing: 12) {
            if let icon = item.icon {
                icon
            }

            Text(item.message)
                .stTypography14Regular(isSingleLine: false)
                .foregroundStyle(stColor: style.foreground)
                .multilineTextAlignment(.center)
        }
        .padding(style.padding)
        .background(stColor: style.background)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .opacity(isPresented ? 1 : 0)
        .animation(
            .spring(response: 0.36, dampingFraction: 0.86), value: isPresented)
        .onAppear {
            isPresented = true
            guard let duration = item.duration else {
                return
            }
            
            timer = Timer
                .scheduledTimer(withTimeInterval: duration, repeats: false, block: { _ in
                    isPresented = false
                    onDismiss()
                })
        }
    }
}

#Preview("Toast") {
    STToast(
        item: .init(
            message: "Saved to workspace. Changes will sync in a moment."
        )
    )
}
