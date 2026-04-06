//
//  SwiftUIView.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/2/27.
//

import SwiftUI

public struct STCheckBoxStyle: ToggleStyle {
    private enum Metrics {
        static let borderWidth: CGFloat = 1
        static let indicatorSize: CGFloat = 20
        static let innerIndicatorSize: CGFloat = 10
        static let tapTargetSize: CGFloat = 24
        static let labelSpacing: CGFloat = 4
    }
    
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        STCheckBox(configuration: configuration)
    }
    
    private struct STCheckBox: View {
        let configuration: ToggleStyleConfiguration
        @Environment(\.isEnabled) private var isEnabled
        
        var body: some View {
            HStack(spacing: Metrics.labelSpacing) {
                Button("") {
                    configuration.isOn.toggle()
                }
                .buttonStyle(CheckBoxButtonStyle(isOn: configuration.isOn))
                configuration.label
                    .font(stTypography: .regular14)
                    .foregroundStyle(stColor: labelColor)
            }
        }
        
        var labelColor: STAsset.ColorPalette {
            isEnabled || configuration.isOn ? .textPrimary : .textDisabled
        }
    }
    
    private struct CheckBoxButtonStyle: ButtonStyle {
        let isOn: Bool
        @Environment(\.isEnabled) private var isEnabled
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                Circle()
                    .strokeBorder(borderColor, lineWidth: Metrics.borderWidth)
                if isOn {
                    Circle()
                        .fill(innerColor)
                        .frame(
                            width: Metrics.innerIndicatorSize,
                            height: Metrics.innerIndicatorSize
                        )
                }
            }
            .frame(width: Metrics.indicatorSize, height: Metrics.indicatorSize)
            .frame(width: Metrics.tapTargetSize, height: Metrics.tapTargetSize)
        }
        
        var backgroundColor: Color {
            color(for: isEnabled ? .white : .grayBg)
        }
        
        var borderColor: Color {
            let palette: STAsset.ColorPalette = isOn && isEnabled ? .brandDefault : .grayBorder
            return color(for: palette)
        }
        
        var innerColor: Color {
            color(for: isEnabled ? .brandDefault : .grayBorder)
        }
        
        func color(for palette: STAsset.ColorPalette) -> Color {
            var asset = palette.colorAsset
            return asset.swiftUIColor
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 16) {
        Toggle("选项", isOn: .constant(true))
            .toggleStyle(STCheckBoxStyle())
        Toggle("选项", isOn: .constant(true))
            .toggleStyle(STCheckBoxStyle())
            .disabled(true)
        Toggle("选项", isOn: .constant(false))
            .toggleStyle(STCheckBoxStyle())
        Toggle("选项", isOn: .constant(false))
            .toggleStyle(STCheckBoxStyle())
            .disabled(true)
        Toggle("", isOn: .constant(true))
            .toggleStyle(STCheckBoxStyle())
    }
}
