//
//  File.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/2/27.
//

import SwiftUI

public enum STTypography {
    case regular9
    case regular10
    case regular12
    case regular14
    case regular16
    case regular18
    case regular20
    case regular22

    case medium9
    case medium10
    case medium12
    case medium13
    case medium14
    case medium16
    case medium18
    case medium20
    case medium22

    case semibold9
    case semibold10
    case semibold12
    case semibold13
    case semibold14
    case semibold16
    case semibold18
    case semibold20
    case semibold22

    case bold9
    case bold10
    case bold12
    case bold14
    case bold16
    case bold18
    case bold20
    case bold22

    typealias Value = (size: CGFloat, weight: Font.Weight)

    var value: Value {
        switch self {
        case .regular9:
            return (size: 9, weight: .regular)
        case .regular10:
            return (size: 10, weight: .regular)
        case .regular12:
            return (size: 12, weight: .regular)
        case .regular14:
            return (size: 14, weight: .regular)
        case .regular16:
            return (size: 16, weight: .regular)
        case .regular18:
            return (size: 18, weight: .regular)
        case .regular20:
            return (size: 20, weight: .regular)
        case .regular22:
            return (size: 22, weight: .regular)

        case .medium9:
            return (size: 9, weight: .medium)
        case .medium10:
            return (size: 10, weight: .medium)
        case .medium12:
            return (size: 12, weight: .medium)
        case .medium13:
            return (size: 13, weight: .medium)
        case .medium14:
            return (size: 14, weight: .medium)
        case .medium16:
            return (size: 16, weight: .medium)
        case .medium18:
            return (size: 18, weight: .medium)
        case .medium20:
            return (size: 20, weight: .medium)
        case .medium22:
            return (size: 22, weight: .medium)

        case .semibold9:
            return (size: 9, weight: .semibold)
        case .semibold10:
            return (size: 10, weight: .semibold)
        case .semibold12:
            return (size: 12, weight: .semibold)
        case .semibold13:
            return (size: 13, weight: .semibold)
        case .semibold14:
            return (size: 14, weight: .semibold)
        case .semibold16:
            return (size: 16, weight: .semibold)
        case .semibold18:
            return (size: 18, weight: .semibold)
        case .semibold20:
            return (size: 20, weight: .semibold)
        case .semibold22:
            return (size: 22, weight: .semibold)

        case .bold9:
            return (size: 9, weight: .bold)
        case .bold10:
            return (size: 10, weight: .bold)
        case .bold12:
            return (size: 12, weight: .bold)
        case .bold14:
            return (size: 14, weight: .bold)
        case .bold16:
            return (size: 16, weight: .bold)
        case .bold18:
            return (size: 18, weight: .bold)
        case .bold20:
            return (size: 20, weight: .bold)
        case .bold22:
            return (size: 22, weight: .bold)
        }
    }
    
    var font: Font {
        let value = value
        return .system(
            size: value.size,
            weight: value.weight
        )
    }
}

public extension Text {
    func font(stTypography: STTypography) -> Text {
        font(
            stTypography.font
        )
    }
}

public extension View {
    func font(stTypography: STTypography) -> some View {
        font(stTypography.font)
    }
}
