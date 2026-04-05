//
//  STModelViewModifier.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/4/4.
//

import SwiftUI

// Workaround to remove the background added when using .fullScreenCover() and appear animation
// Can be removed, once .fullScreenCover allows to select the appropriate appear/disappear animation
struct BackgroundTransparentView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = TransparentView()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

private class TransparentView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()

        superview?.superview?.backgroundColor = .clear

        var responder: UIResponder? = superview?.superview?.next
        while responder != nil {
            guard let responder, let vc = responder as? UIViewController else {
                responder = responder?.next
                continue
            }
            vc.modalTransitionStyle = .crossDissolve
            break
        }
    }
}

public extension View {

    func stModal<ModalContent: View, ModalActions: View>(
        title: String?,
        style: STModalView<ModalContent, ModalActions>.Style = .bottomSheet,
        dismissWhenTapBackground: Bool = true,
        backgroundColor: Color = .clear,
        showDragIndicator: Bool = true,
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> ModalContent,
        @ViewBuilder actions: @escaping () -> ModalActions?
    ) -> some View {
        fullScreenCover(isPresented: isPresented) {
            STModalView(
                title: title,
                style: style,
                dismissWhenTapBackground: dismissWhenTapBackground,
                backgroundColor: backgroundColor,
                showDragIndicator: showDragIndicator,
                isPresented: isPresented,
                content: content,
                actions: actions
            )
            .background {
                BackgroundTransparentView()
            }
        }
        .transaction { transaction in
            transaction.disablesAnimations = isPresented.wrappedValue
        }
    }
}
