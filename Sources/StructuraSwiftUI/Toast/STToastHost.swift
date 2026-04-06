//
//  STToastHost.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/4/1.
//

import SwiftUI

private struct STToastPresenterKey: EnvironmentKey {
    static let defaultValue: STToastPresenter? = nil
}

public extension EnvironmentValues {
    var stToastPresenter: STToastPresenter? {
        get { self[STToastPresenterKey.self] }
        set { self[STToastPresenterKey.self] = newValue }
    }
}

public extension View {
    func stToastHost(using presenter: STToastPresenter) -> some View {
        modifier(STToastHostModifier(presenter: presenter))
    }

    func stToast(item: Binding<STToastItem?>) -> some View {
        modifier(STToastBindingModifier(item: item))
    }
}

public struct STToastHostModifier: ViewModifier {
    public let presenter: STToastPresenter

    public init(presenter: STToastPresenter) {
        self.presenter = presenter
    }

    public func body(content: Content) -> some View {
        content.overlay {
            Color.clear
            STToastOverlay(item: presenter.currentToast) {
                presenter.dismissCurrent()
            }
        }
        .environment(\.stToastPresenter, presenter)
    }
}

public struct STToastBindingModifier: ViewModifier {
    @Binding var item: STToastItem?

    public init(item: Binding<STToastItem?>) {
        _item = item
    }

    public func body(content: Content) -> some View {
        content.overlay {
            Color.clear
            STToastOverlay(item: item) {
                item = nil
            }
        }
    }
}

private struct STToastOverlay: View {
    let item: STToastItem?
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            Spacer()
            if let item {
                STToast(item: item, onDismiss: onDismiss)
                    .padding(.horizontal, 16)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: item.type.alignment
                    )
            }
        }
    }
}

#Preview("Host") {
    PreviewToastHost()
}

private struct PreviewToastHost: View {
    @State private var localToast: STToastItem?
    @State private var presenter = STToastPresenter()

    var body: some View {
        VStack(spacing: 16) {
            Button("Show Global Toast") {
                presenter.show(
                    .init(message: "Warning", indicatorType: .warning)
                )
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .stToast(item: $localToast)
        .stToastHost(using: presenter)
    }
}
