//
//  File.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/2/27.
//

import Foundation
// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum STAsset {
  public enum ColorPalette: CaseIterable {
    static let bgBlackAsset = ColorAsset(name: "bg_black")
    static let blackAsset = ColorAsset(name: "black")
    static let brandActiveAsset = ColorAsset(name: "brand_active")
    static let brandBgAsset = ColorAsset(name: "brand_bg")
    static let brandBorderAsset = ColorAsset(name: "brand_border")
    static let brandDefaultAsset = ColorAsset(name: "brand_default")
    static let brandDisabledAsset = ColorAsset(name: "brand_disabled")
    static let expandBlueBgAsset = ColorAsset(name: "expand_blue_bg")
    static let expandBlueDefaultAsset = ColorAsset(name: "expand_blue_default")
    static let expandCyanBgAsset = ColorAsset(name: "expand_cyan_bg")
    static let expandCyanDefaultAsset = ColorAsset(name: "expand_cyan_default")
    static let expandPinkBgAsset = ColorAsset(name: "expand_pink_bg")
    static let expandPinkDefaultAsset = ColorAsset(name: "expand_pink_default")
    static let expandPurpleBgAsset = ColorAsset(name: "expand_purple_bg")
    static let expandPurpleBlueBgAsset = ColorAsset(name: "expand_purple_blue_bg")
    static let expandPurpleBlueDefaultAsset = ColorAsset(name: "expand_purple_blue_default")
    static let expandPurpleDefaultAsset = ColorAsset(name: "expand_purple_default")
    static let expandRedDefaultAsset = ColorAsset(name: "expand_red_default")
    static let expandYellowBgAsset = ColorAsset(name: "expand_yellow_bg")
    static let expandYellowDefaultAsset = ColorAsset(name: "expand_yellow_default")
    static let grayActiveAsset = ColorAsset(name: "gray_active")
    static let grayBgAsset = ColorAsset(name: "gray_bg")
    static let grayBorderAsset = ColorAsset(name: "gray_border")
    static let grayBtnAsset = ColorAsset(name: "gray_btn")
    static let grayIconPrimaryAsset = ColorAsset(name: "gray_icon_primary")
    static let grayIconSecondaryAsset = ColorAsset(name: "gray_icon_secondary")
    static let grayLineAsset = ColorAsset(name: "gray_line")
    static let opacityBlack10Asset = ColorAsset(name: "opacity_black10")
    static let opacityBlack20Asset = ColorAsset(name: "opacity_black20")
    static let opacityBlack30Asset = ColorAsset(name: "opacity_black30")
    static let opacityBlack50Asset = ColorAsset(name: "opacity_black50")
    static let opacityBlack70Asset = ColorAsset(name: "opacity_black70")
    static let opacityWhite10Asset = ColorAsset(name: "opacity_white10")
    static let opacityWhite20Asset = ColorAsset(name: "opacity_white20")
    static let opacityWhite30Asset = ColorAsset(name: "opacity_white30")
    static let opacityWhite50Asset = ColorAsset(name: "opacity_white50")
    static let opacityWhite70Asset = ColorAsset(name: "opacity_white70")
    static let orangeActiveAsset = ColorAsset(name: "orange_active")
    static let orangeBgAsset = ColorAsset(name: "orange_bg")
    static let orangeDefaultAsset = ColorAsset(name: "orange_default")
    static let orangeDisabledAsset = ColorAsset(name: "orange_disabled")
    static let pinkActiveAsset = ColorAsset(name: "pink_active")
    static let pinkBgAsset = ColorAsset(name: "pink_bg")
    static let pinkDefaultAsset = ColorAsset(name: "pink_default")
    static let pinkDisabledAsset = ColorAsset(name: "pink_disabled")
    static let textBtnActiveAsset = ColorAsset(name: "text_btn_active")
    static let textBtnDefaultAsset = ColorAsset(name: "text_btn_default")
    static let textBtnDisabledAsset = ColorAsset(name: "text_btn_disabled")
    static let textDefaultAsset = ColorAsset(name: "text_default")
    static let textDisabledAsset = ColorAsset(name: "text_disabled")
    static let textPrimaryAsset = ColorAsset(name: "text_primary")
    static let textSecondaryAsset = ColorAsset(name: "text_secondary")
    static let textTertiaryAsset = ColorAsset(name: "text_tertiary")
    static let vipActiveAsset = ColorAsset(name: "vip_active")
    static let vipBgAsset = ColorAsset(name: "vip_bg")
    static let vipDefaultAsset = ColorAsset(name: "vip_default")
    static let vipDisabledAsset = ColorAsset(name: "vip_disabled")
    static let warningActiveAsset = ColorAsset(name: "warning_active")
    static let warningBgAsset = ColorAsset(name: "warning_bg")
    static let warningDefaultAsset = ColorAsset(name: "warning_default")
    static let warningDisabledAsset = ColorAsset(name: "warning_disabled")
    static let whiteAsset = ColorAsset(name: "white")
    static let yellowActiveAsset = ColorAsset(name: "yellow_active")
    static let yellowBgAsset = ColorAsset(name: "yellow_bg")
    static let yellowDefaultAsset = ColorAsset(name: "yellow_default")
    static let yellowDisabledAsset = ColorAsset(name: "yellow_disabled")
    case bgBlack
    case black
    case brandActive
    case brandBg
    case brandBorder
    case brandDefault
    case brandDisabled
    case expandBlueBg
    case expandBlueDefault
    case expandCyanBg
    case expandCyanDefault
    case expandPinkBg
    case expandPinkDefault
    case expandPurpleBg
    case expandPurpleBlueBg
    case expandPurpleBlueDefault
    case expandPurpleDefault
    case expandRedDefault
    case expandYellowBg
    case expandYellowDefault
    case grayActive
    case grayBg
    case grayBorder
    case grayBtn
    case grayIconPrimary
    case grayIconSecondary
    case grayLine
    case opacityBlack10
    case opacityBlack20
    case opacityBlack30
    case opacityBlack50
    case opacityBlack70
    case opacityWhite10
    case opacityWhite20
    case opacityWhite30
    case opacityWhite50
    case opacityWhite70
    case orangeActive
    case orangeBg
    case orangeDefault
    case orangeDisabled
    case pinkActive
    case pinkBg
    case pinkDefault
    case pinkDisabled
    case textBtnActive
    case textBtnDefault
    case textBtnDisabled
    case textDefault
    case textDisabled
    case textPrimary
    case textSecondary
    case textTertiary
    case vipActive
    case vipBg
    case vipDefault
    case vipDisabled
    case warningActive
    case warningBg
    case warningDefault
    case warningDisabled
    case white
    case yellowActive
    case yellowBg
    case yellowDefault
    case yellowDisabled
    public var colorAsset: ColorAsset {
      switch self {
      case .bgBlack:
        return STAsset.ColorPalette.bgBlackAsset
      case .black:
        return STAsset.ColorPalette.blackAsset
      case .brandActive:
        return STAsset.ColorPalette.brandActiveAsset
      case .brandBg:
        return STAsset.ColorPalette.brandBgAsset
      case .brandBorder:
        return STAsset.ColorPalette.brandBorderAsset
      case .brandDefault:
        return STAsset.ColorPalette.brandDefaultAsset
      case .brandDisabled:
        return STAsset.ColorPalette.brandDisabledAsset
      case .expandBlueBg:
        return STAsset.ColorPalette.expandBlueBgAsset
      case .expandBlueDefault:
        return STAsset.ColorPalette.expandBlueDefaultAsset
      case .expandCyanBg:
        return STAsset.ColorPalette.expandCyanBgAsset
      case .expandCyanDefault:
        return STAsset.ColorPalette.expandCyanDefaultAsset
      case .expandPinkBg:
        return STAsset.ColorPalette.expandPinkBgAsset
      case .expandPinkDefault:
        return STAsset.ColorPalette.expandPinkDefaultAsset
      case .expandPurpleBg:
        return STAsset.ColorPalette.expandPurpleBgAsset
      case .expandPurpleBlueBg:
        return STAsset.ColorPalette.expandPurpleBlueBgAsset
      case .expandPurpleBlueDefault:
        return STAsset.ColorPalette.expandPurpleBlueDefaultAsset
      case .expandPurpleDefault:
        return STAsset.ColorPalette.expandPurpleDefaultAsset
      case .expandRedDefault:
        return STAsset.ColorPalette.expandRedDefaultAsset
      case .expandYellowBg:
        return STAsset.ColorPalette.expandYellowBgAsset
      case .expandYellowDefault:
        return STAsset.ColorPalette.expandYellowDefaultAsset
      case .grayActive:
        return STAsset.ColorPalette.grayActiveAsset
      case .grayBg:
        return STAsset.ColorPalette.grayBgAsset
      case .grayBorder:
        return STAsset.ColorPalette.grayBorderAsset
      case .grayBtn:
        return STAsset.ColorPalette.grayBtnAsset
      case .grayIconPrimary:
        return STAsset.ColorPalette.grayIconPrimaryAsset
      case .grayIconSecondary:
        return STAsset.ColorPalette.grayIconSecondaryAsset
      case .grayLine:
        return STAsset.ColorPalette.grayLineAsset
      case .opacityBlack10:
        return STAsset.ColorPalette.opacityBlack10Asset
      case .opacityBlack20:
        return STAsset.ColorPalette.opacityBlack20Asset
      case .opacityBlack30:
        return STAsset.ColorPalette.opacityBlack30Asset
      case .opacityBlack50:
        return STAsset.ColorPalette.opacityBlack50Asset
      case .opacityBlack70:
        return STAsset.ColorPalette.opacityBlack70Asset
      case .opacityWhite10:
        return STAsset.ColorPalette.opacityWhite10Asset
      case .opacityWhite20:
        return STAsset.ColorPalette.opacityWhite20Asset
      case .opacityWhite30:
        return STAsset.ColorPalette.opacityWhite30Asset
      case .opacityWhite50:
        return STAsset.ColorPalette.opacityWhite50Asset
      case .opacityWhite70:
        return STAsset.ColorPalette.opacityWhite70Asset
      case .orangeActive:
        return STAsset.ColorPalette.orangeActiveAsset
      case .orangeBg:
        return STAsset.ColorPalette.orangeBgAsset
      case .orangeDefault:
        return STAsset.ColorPalette.orangeDefaultAsset
      case .orangeDisabled:
        return STAsset.ColorPalette.orangeDisabledAsset
      case .pinkActive:
        return STAsset.ColorPalette.pinkActiveAsset
      case .pinkBg:
        return STAsset.ColorPalette.pinkBgAsset
      case .pinkDefault:
        return STAsset.ColorPalette.pinkDefaultAsset
      case .pinkDisabled:
        return STAsset.ColorPalette.pinkDisabledAsset
      case .textBtnActive:
        return STAsset.ColorPalette.textBtnActiveAsset
      case .textBtnDefault:
        return STAsset.ColorPalette.textBtnDefaultAsset
      case .textBtnDisabled:
        return STAsset.ColorPalette.textBtnDisabledAsset
      case .textDefault:
        return STAsset.ColorPalette.textDefaultAsset
      case .textDisabled:
        return STAsset.ColorPalette.textDisabledAsset
      case .textPrimary:
        return STAsset.ColorPalette.textPrimaryAsset
      case .textSecondary:
        return STAsset.ColorPalette.textSecondaryAsset
      case .textTertiary:
        return STAsset.ColorPalette.textTertiaryAsset
      case .vipActive:
        return STAsset.ColorPalette.vipActiveAsset
      case .vipBg:
        return STAsset.ColorPalette.vipBgAsset
      case .vipDefault:
        return STAsset.ColorPalette.vipDefaultAsset
      case .vipDisabled:
        return STAsset.ColorPalette.vipDisabledAsset
      case .warningActive:
        return STAsset.ColorPalette.warningActiveAsset
      case .warningBg:
        return STAsset.ColorPalette.warningBgAsset
      case .warningDefault:
        return STAsset.ColorPalette.warningDefaultAsset
      case .warningDisabled:
        return STAsset.ColorPalette.warningDisabledAsset
      case .white:
        return STAsset.ColorPalette.whiteAsset
      case .yellowActive:
        return STAsset.ColorPalette.yellowActiveAsset
      case .yellowBg:
        return STAsset.ColorPalette.yellowBgAsset
      case .yellowDefault:
        return STAsset.ColorPalette.yellowDefaultAsset
      case .yellowDisabled:
        return STAsset.ColorPalette.yellowDisabledAsset
      }
    }
    public var color: ColorAsset.Color {
      var asset = colorAsset
      return asset.color
    }
  }
  public enum Images : CaseIterable {
    public var imageAsset: ImageAsset {
        .init(name: "")
    }
    public var image: ImageAsset.Image {
      return imageAsset.image
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details


public struct ColorAsset : Sendable {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
    
    init(colorPalette: STAsset.ColorPalette) {
        self.init(asset: colorPalette.colorAsset)
    }
}
#endif

public struct ImageAsset : Sendable {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
