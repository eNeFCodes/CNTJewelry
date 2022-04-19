// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "SFont.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = SFont.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontCollections {
  internal enum BrilliantCutProB7 {
    internal static let black = SFont(name: "BrilliantCutProB7-Black", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Black.otf")
    internal static let bold = SFont(name: "BrilliantCutProB7-Bold", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Bold.otf")
    internal static let light = SFont(name: "BrilliantCutProB7-Light", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Light.otf")
    internal static let medium = SFont(name: "BrilliantCutProB7-Medium", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Medium.otf")
    internal static let regular = SFont(name: "BrilliantCutProB7-Regular", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Regular.otf")
    internal static let thin = SFont(name: "BrilliantCutProB7-Thin", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Thin.otf")
    internal static let all: [SFont] = [black, bold, light, medium, regular, thin]
  }
  internal enum FancyCutCondProB7 {
    internal static let bold = SFont(name: "FancyCutCondProB7-Bold", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Bold.otf")
    internal static let boldItalic = SFont(name: "FancyCutCondProB7-BoldItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-BoldItalic.otf")
    internal static let light = SFont(name: "FancyCutCondProB7-Light", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Light.otf")
    internal static let lightItalic = SFont(name: "FancyCutCondProB7-LightItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-LightItalic.otf")
    internal static let medium = SFont(name: "FancyCutCondProB7-Medium", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Medium.otf")
    internal static let mediumItalic = SFont(name: "FancyCutCondProB7-MediumItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-MediumItalic.otf")
    internal static let regular = SFont(name: "FancyCutCondProB7-Regular", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Regular.otf")
    internal static let regularItalic = SFont(name: "FancyCutCondProB7-RegularItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-RegularItalic.otf")
    internal static let thin = SFont(name: "FancyCutCondProB7-Thin", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Thin.otf")
    internal static let thinItalic = SFont(name: "FancyCutCondProB7-ThinItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-ThinItalic.otf")
    internal static let all: [SFont] = [bold, boldItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, thin, thinItalic]
  }
  internal enum FancyCutExtProB7 {
    internal static let bold = SFont(name: "FancyCutExtProB7-Bold", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Bold.otf")
    internal static let boldItalic = SFont(name: "FancyCutExtProB7-BoldItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-BoldItalic.otf")
    internal static let light = SFont(name: "FancyCutExtProB7-Light", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Light.otf")
    internal static let lightItalic = SFont(name: "FancyCutExtProB7-LightItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-LightItalic.otf")
    internal static let medium = SFont(name: "FancyCutExtProB7-Medium", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Medium.otf")
    internal static let mediumItalic = SFont(name: "FancyCutExtProB7-MediumItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-MediumItalic.otf")
    internal static let regular = SFont(name: "FancyCutExtProB7-Regular", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Regular.otf")
    internal static let regularItalic = SFont(name: "FancyCutExtProB7-RegularItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-RegularItalic.otf")
    internal static let thin = SFont(name: "FancyCutExtProB7-Thin", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Thin.otf")
    internal static let thinItalic = SFont(name: "FancyCutExtProB7-ThinItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-ThinItalic.otf")
    internal static let all: [SFont] = [bold, boldItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, thin, thinItalic]
  }
  internal enum FancyCutProB7 {
    internal static let bold = SFont(name: "FancyCutProB7-Bold", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Bold.otf")
    internal static let boldItalic = SFont(name: "FancyCutProB7-BoldItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-BoldItalic.otf")
    internal static let light = SFont(name: "FancyCutProB7-Light", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Light.otf")
    internal static let lightItalic = SFont(name: "FancyCutProB7-LightItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-LightItalic.otf")
    internal static let medium = SFont(name: "FancyCutProB7-Medium", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Medium.otf")
    internal static let mediumItalic = SFont(name: "FancyCutProB7-MediumItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-MediumItalic.otf")
    internal static let regular = SFont(name: "FancyCutProB7-Regular", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Regular.otf")
    internal static let regularItalic = SFont(name: "FancyCutProB7-RegularItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-RegularItalic.otf")
    internal static let thin = SFont(name: "FancyCutProB7-Thin", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Thin.otf")
    internal static let thinItalic = SFont(name: "FancyCutProB7-ThinItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-ThinItalic.otf")
    internal static let all: [SFont] = [bold, boldItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, thin, thinItalic]
  }
  internal static let allCustomFonts: [SFont] = [BrilliantCutProB7.all, FancyCutCondProB7.all, FancyCutExtProB7.all, FancyCutProB7.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct SFont {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(macOS)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension SFont.Font {
  convenience init?(font: SFont, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

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
