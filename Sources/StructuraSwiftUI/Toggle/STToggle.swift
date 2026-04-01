//
//  STToggle.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/3/31.
//

import SwiftUI

public struct STToggleStyle: ToggleStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        STToggle(configuration: configuration)
    }
    
    private struct STToggle: View {
        let configuration: ToggleStyleConfiguration
        
        var body: some View {
            HStack {
                configuration.label
                Spacer()
                Button("") {
                    configuration.isOn.toggle()
                }.buttonStyle(ToggleButtonStyle(isOn: configuration.isOn))
            }
        }
    }
    
    private struct ToggleButtonStyle: ButtonStyle {
        let isOn: Bool
        @Environment(\.isEnabled) private var isEnabled: Bool
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .fill(isOn ? onColor : offColor)
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .strokeBorder(borderColor, lineWidth: 1)
            }
                .frame(width: 48, height: 24)
                .overlay {
                    Circle().fill(innerColor)
                        .frame(width: innerSize, height: innerSize)
                        .offset(x: isOn ? 12 : -12)
                }
                .frame(width: 48, height: 30)
                .animation(Animation.easeInOut(duration: 0.1), value: isOn)
        }
        
        var onColor: Color {
            let color: STAsset.ColorPalette = isEnabled ? .brandDefault : .brandDisabled
            var asset = color.colorAsset
            return asset.swiftUIColor
        }
        
        var offColor: Color {
            let color: STAsset.ColorPalette = isEnabled ? .white : .grayBg
            var asset = color.colorAsset
            return asset.swiftUIColor
        }
        
        var borderColor: Color {
            let color: STAsset.ColorPalette? = isOn ? nil : (
                isEnabled ? .grayBorder : .grayActive
            )
            var asset = color?.colorAsset
            return asset?.swiftUIColor ?? Color.clear
        }
        
        var innerColor: Color {
            let color: STAsset.ColorPalette? = isOn ? .white : .grayBorder
            var asset = color?.colorAsset
            return asset?.swiftUIColor ?? Color.clear
        }
        
        var innerSize: CGFloat {
            isOn ? 16 : 12
        }
    }
}

#Preview {
}
