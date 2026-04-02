//
//  STToastModel.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/4/1.
//

import SwiftUI


public struct STToastItem: Identifiable {
    public enum STToastType: Sendable {
        case normal
        
        var alignment: Alignment {
            switch self {
            case .normal:
                    .center
            }
        }
        
        var style: STToastStyle {
            switch self {
            case .normal:
                    .init(
                        foreground: .white,
                        background: .bgBlack,
                        padding: .init(top: 20, leading: 16, bottom: 20, trailing: 16)
                    )
            }
        }
    }
    
    public struct STToastStyle {
        public let foreground: STAsset.ColorPalette
        public let background: STAsset.ColorPalette
        public let border: STAsset.ColorPalette?
        public let padding: EdgeInsets
        
        init(
            foreground: STAsset.ColorPalette,
            background: STAsset.ColorPalette,
            border: STAsset.ColorPalette? = nil,
            padding: EdgeInsets
        ) {
            self.foreground = foreground
            self.background = background
            self.border = border
            self.padding = padding
        }
    }
    
    public enum IndicatorType {
        case success
        case fail
        case warning
        case loading
    }
    
    public let id: UUID
    public let message: String
    public let type: STToastType
    public let indicatorType: IndicatorType?
    public let duration: TimeInterval?
    
    init(
        id: UUID = UUID(),
        message: String,
        type: STToastType = .normal,
        indicatorType: IndicatorType? = .loading,
        duration: TimeInterval? = 2
    ) {
        self.id = id
        self.message = message
        self.type = type
        self.indicatorType = indicatorType
        self.duration = duration
    }
    
    var icon: Image? {
        guard let indicatorType else { return nil }
        let symbolName: String
        switch indicatorType {
        case .success:
            symbolName = "checkmark.circle"
        case .fail:
            symbolName = "xmark"
        case .warning:
            symbolName = "square.and.pencil"
        case .loading:
            symbolName = "alarm"
        }
        return .init(systemName: symbolName)
    }
}
