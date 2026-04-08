//
//  STButton.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/3/29.
//

import SwiftUI

public enum STButtonSize {
    case big
    case medium
    case small
    
    var padding: EdgeInsets {
        switch self {
        case .big:
            return .init(top: 12, leading: 140, bottom: 12, trailing: 140)
        case .medium:
            return .init(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .small:
            return .init(top: 6, leading: 16, bottom: 6, trailing: 16)
        }
    }
    
    var fontSize: STTypography {
        switch self {
        case .big:
            return .semibold16
        case .medium:
            return .semibold16
        case .small:
            return .semibold14
        }
    }
}

public enum STButtonColorStyle {
    case primary // brand theming
    case sub // brand theming with white background
    case weak // gray theming with semi-white background
    case gray // gray theming
    
    var normalForgroundStColor: STAsset.ColorPalette {
        switch self {
        case .primary:
            return .white
        case .sub:
            return .brandDefault
        case .weak:
            return .textSecondary
        case .gray:
            return .textSecondary
        }
    }
    
    var selectedForgroundStColor: STAsset.ColorPalette {
        switch self {
        case .primary:
            return .white
        case .sub:
            return .brandDefault
        case .weak:
            return .textSecondary
        case .gray:
            return .textSecondary
        }
    }
    
    var disabledForgroundStColor: STAsset.ColorPalette {
        switch self {
        case .primary:
            return .white
        case .sub:
            return .brandDisabled
        case .weak:
            return .textDisabled
        case .gray:
            return .textDisabled
        }
    }
    
    var normalBackgroundStColor: STAsset.ColorPalette {
        switch self {
        case .primary:
            return .brandDefault
        case .sub:
            return .white
        case .weak:
            return .white
        case .gray:
            return .grayBtn
        }
    }
    
    var selectedBackgroundStColor: STAsset.ColorPalette {
        switch self {
        case .primary:
            return .brandActive
        case .sub:
            return .white
        case .weak:
            return .grayBg
        case .gray:
            return .grayActive
        }
    }
    
    var disabledBackgroundStColor: STAsset.ColorPalette {
        switch self {
        case .primary:
            return .brandDisabled
        case .sub:
            return .white
        case .weak:
            return .white
        case .gray:
            return .grayBg
        }
    }
    
    var normalBorderStColor: STAsset.ColorPalette? {
        switch self {
        case .primary:
            return nil
        case .sub:
            return .brandDefault
        case .weak:
            return .grayBorder
        case .gray:
            return nil
        }
    }
    
    var selectedBorderStColor: STAsset.ColorPalette? {
        switch self {
        case .primary:
            return nil
        case .sub:
            return .brandDisabled
        case .weak:
            return .grayBorder
        case .gray:
            return nil
        }
    }
    
    var disabledBorderStColor: STAsset.ColorPalette? {
        switch self {
        case .primary:
            return nil
        case .sub:
            return .brandDefault
        case .weak:
            return .grayBorder
        case .gray:
            return nil
        }
    }
}

public extension View {
    func stButtonStyle(size: STButtonSize, style: STButtonColorStyle) -> some View {
        buttonStyle(
            STButtonStyle(isFixed: size == .big ? false : true, size: size, colorStyle: style)
        )
    }
}

public struct STButtonStyle: ButtonStyle {
    let isFixed: Bool
    let size: STButtonSize
    let colorStyle: STButtonColorStyle

    public init(isFixed: Bool, size: STButtonSize, colorStyle: STButtonColorStyle) {
        self.isFixed = isFixed
        self.size = size
        self.colorStyle = colorStyle
    }

    struct STButton: View {
        let label: ButtonStyleConfiguration.Label
        let isPressed: Bool
        @Environment(\.isEnabled) var isEnabled
        let isFixed: Bool
        let size: STButtonSize
        let colorStyle: STButtonColorStyle
        var body: some View {
            label
                .font(stTypography: size.fontSize)
                .foregroundStyle(
                    stColor: isEnabled ? colorStyle.normalForgroundStColor : colorStyle.disabledForgroundStColor
                )
                .padding(size.padding)
                .frame(maxWidth: isFixed ? nil : .infinity)
                .background(stColor: backgroundColor)
                .overlay {
                    Capsule()
                        .stroke(
                            borderColor,
                            lineWidth: 1
                        )
                }
                .clipShape(.capsule)
        }
        
        var backgroundColor: STAsset.ColorPalette {
            isEnabled ? (
                isPressed ? colorStyle.selectedBackgroundStColor : colorStyle.normalBackgroundStColor
            ) : colorStyle.disabledBackgroundStColor
        }
        
        var borderColor: Color {
            if let colorPalette = isEnabled ? (
                isPressed ? colorStyle.selectedBorderStColor : colorStyle.normalBorderStColor
            ) : colorStyle.disabledBorderStColor {
                return .init(colorPalette: colorPalette)
            } else {
                return .clear
            }
        }
    }
    
    
    public func makeBody(configuration: Configuration) -> some View {
        STButton(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isFixed: isFixed,
            size: size,
            colorStyle: colorStyle
        )
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("test") {}
            .stButtonStyle(size: .medium, style: .gray)
        Color.clear
    }

}
