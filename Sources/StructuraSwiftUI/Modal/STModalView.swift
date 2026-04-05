//
//  STModalView.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/4/4.
//

import SwiftUI

private enum STModalMetrics {
    static let cornerRadius: CGFloat = 24
    static let dialogMaxWidth: CGFloat = 300
    static let modalSpacing: CGFloat = 16
    static let animationDuration: CGFloat = 0.25
}

private struct ModalViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

public struct STModalView<ModalContent: View, ModalActions: View>: View {
    public enum Style {
        case dialog // centered dialog
        case bottomSheet // bottom sheet like
        
        var alignment: Alignment {
            switch self {
            case .dialog:
                return .center
            case .bottomSheet:
                return .bottom
            }
        }
        
        var maxWidth: CGFloat {
            switch self {
            case .dialog:
                return STModalMetrics.dialogMaxWidth
            case .bottomSheet:
                return .infinity
            }
        }
        
        var modalScale: CGSize {
            switch self {
            case .dialog:
                return .init(width: 1.1, height: 1.1)
            case .bottomSheet:
                return .init(width: 1, height: 1)
            }
        }
        
        var roundedCorners: UIRectCorner {
            switch self {
            case .dialog:
                [.topLeft, .topRight]
            case .bottomSheet:
                .allCorners
            }
        }
    }

    public let title: String?
    public let style: Style
    public let dismissWhenTapBackground: Bool
    public let backgroundColor: Color
    public let showDragIndicator: Bool
    @Binding public var isPresented: Bool
    public let content: ModalContent
    public let actions: ModalActions?
    @State var backgroundOpacity: Double = 0.0
    @State var modalOpacity: Double = 0.0
    @State var modalOffset: CGSize = .zero
    @State var modalOffsetAnimation: Animation?
    @State var modalInitialOffset: CGSize = .zero
    @State var modalScale: CGSize

    public init(
        title: String? = nil,
        style: Style = .bottomSheet,
        dismissWhenTapBackground: Bool = true,
        backgroundColor: Color = .clear,
        showDragIndicator: Bool = true,
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> ModalContent,
        @ViewBuilder actions: () -> ModalActions?
    ) {
        self.title = title
        self.style = style
        self.dismissWhenTapBackground = dismissWhenTapBackground
        self.backgroundColor = backgroundColor
        self.showDragIndicator = style == .bottomSheet ? showDragIndicator : false
        _isPresented = isPresented
        self.content = content()
        self.actions = actions()
        modalScale = style.modalScale
    }
    
    public var body: some View {
        GeometryReader { geometryProxy in
            ZStack(alignment: style.alignment) {
                backgroundOverlay
                modalContent(safeAreaBottomInset: geometryProxy.safeAreaInsets.bottom)
                    .frame(maxWidth: style.maxWidth)
                    .background(
                        Rectangle()
                            .cornerRadius(12, corners: style.roundedCorners)
                            .foregroundStyle(stColor: .white)
                    )
                    .opacity(modalOpacity)
                    .offset(modalOffset)
                    .animation(
                        .easeInOut(duration: STModalMetrics.animationDuration),
                        value: modalOpacity
                    )
                    .animation(modalOffsetAnimation, value: modalOffset)
                    .scaleEffect(style.modalScale)
                    .animation(.easeInOut(duration: STModalMetrics.animationDuration), value: modalOffset)
                    .overlay {
                        GeometryReader { proxy in
                            Color.clear
                                .preference(
                                    key: ModalViewHeightKey.self,
                                    value: proxy
                                        .size.height)
                        }
                    }
            }
            .onPreferenceChange(ModalViewHeightKey.self) {
                guard style == .bottomSheet else {
                    return
                }
                let offset = CGSize(width: 0, height: $0)
                if self.modalInitialOffset == .zero {
                    self.modalOffset = offset
                }
                self.modalInitialOffset = offset
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .onChange(of: isPresented) { oldValue, newValue in
            if !newValue {
                prepareAnimation()
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                prepareAnimation()
            }
        }
    }
    
    private func prepareAnimation() {
        DispatchQueue.main.async {
            self.modalOffsetAnimation = .easeInOut(duration: STModalMetrics.animationDuration)
            modalOpacity = isPresented ? 1 : 0
            modalScale = isPresented ? .init(width: 1, height: 1) : style.modalScale
            if style == .dialog {
                modalOffset = .zero
            } else {
                modalOffset = modalInitialOffset
            }
            backgroundOpacity = isPresented ? 1 : 0
        }
    }

    private var backgroundOverlay: some View {
        Rectangle().fill(backgroundColor)
            .opacity(backgroundOpacity)
            .animation(
                .easeInOut(duration: STModalMetrics.animationDuration),
                value: backgroundOpacity
            )
            .ignoresSafeArea(.all)
            .onTapGesture {
                guard dismissWhenTapBackground else {
                    return
                }

                withAnimation {
                    isPresented = false
                }
            }
    }

    private func modalContent(safeAreaBottomInset: CGFloat) -> some View {
        VStack {
            if showDragIndicator {
                RoundedRectangle(cornerRadius: 2)
                    .fill(
                        Color.init(colorPalette: .grayBg)
                    )
                    .frame(width: 36, height: 4)
            }
            if let title, !title.isEmpty {
                HStack {
                    Text(title)
                        .stTypography12Semibold(isSingleLine: true)
                        .foregroundStyle(stColor: .textPrimary)
                        .frame(maxWidth: 180)
                }.frame(height: 44)
            }
            
            content
            
            if let actions {
                VStack {
                    actions
                }.padding(
                    .init(
                        top: 8,
                        leading: 16,
                        bottom: style == .dialog ? 24 : max(
                            safeAreaBottomInset,
                            40
                        ),
                        trailing: 16
                    )
                )
            }
        }
    }
}

#Preview {
    @Previewable @State var isPresented = false
    @Previewable @State var isOn = false
    
    ZStack {
        Button("Modal") {
            isPresented = true
        }.stModal(
            title: "",
            style: .bottomSheet,
            dismissWhenTapBackground: true,
            backgroundColor: .init(colorPalette: .brandBg),
            isPresented: $isPresented) {
                Toggle("Switch", isOn: $isOn).toggleStyle(STToggleStyle())
            } actions: {
            }
    }
}
