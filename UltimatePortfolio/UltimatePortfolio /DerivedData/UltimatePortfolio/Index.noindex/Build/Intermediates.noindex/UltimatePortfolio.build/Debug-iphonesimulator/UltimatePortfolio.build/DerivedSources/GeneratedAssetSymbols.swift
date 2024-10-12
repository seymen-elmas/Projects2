import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "Dark Blue" asset catalog color resource.
    static let darkBlue = DeveloperToolsSupport.ColorResource(name: "Dark Blue", bundle: resourceBundle)

    /// The "Dark Gray" asset catalog color resource.
    static let darkGray = DeveloperToolsSupport.ColorResource(name: "Dark Gray", bundle: resourceBundle)

    /// The "Gold" asset catalog color resource.
    static let gold = DeveloperToolsSupport.ColorResource(name: "Gold", bundle: resourceBundle)

    /// The "Gray" asset catalog color resource.
    static let gray = DeveloperToolsSupport.ColorResource(name: "Gray", bundle: resourceBundle)

    /// The "Green" asset catalog color resource.
    static let green = DeveloperToolsSupport.ColorResource(name: "Green", bundle: resourceBundle)

    /// The "Light Blue" asset catalog color resource.
    static let lightBlue = DeveloperToolsSupport.ColorResource(name: "Light Blue", bundle: resourceBundle)

    /// The "Midnight" asset catalog color resource.
    static let midnight = DeveloperToolsSupport.ColorResource(name: "Midnight", bundle: resourceBundle)

    /// The "Orange" asset catalog color resource.
    static let orange = DeveloperToolsSupport.ColorResource(name: "Orange", bundle: resourceBundle)

    /// The "Pink" asset catalog color resource.
    static let pink = DeveloperToolsSupport.ColorResource(name: "Pink", bundle: resourceBundle)

    /// The "Purple" asset catalog color resource.
    static let purple = DeveloperToolsSupport.ColorResource(name: "Purple", bundle: resourceBundle)

    /// The "Red" asset catalog color resource.
    static let red = DeveloperToolsSupport.ColorResource(name: "Red", bundle: resourceBundle)

    /// The "Teal" asset catalog color resource.
    static let teal = DeveloperToolsSupport.ColorResource(name: "Teal", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "Dark Blue" asset catalog color.
    static var darkBlue: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .darkBlue)
#else
        .init()
#endif
    }

    #warning("The \"Dark Gray\" color asset name resolves to a conflicting NSColor symbol \"darkGray\". Try renaming the asset.")

    /// The "Gold" asset catalog color.
    static var gold: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .gold)
#else
        .init()
#endif
    }

    #warning("The \"Gray\" color asset name resolves to a conflicting NSColor symbol \"gray\". Try renaming the asset.")

    #warning("The \"Green\" color asset name resolves to a conflicting NSColor symbol \"green\". Try renaming the asset.")

    /// The "Light Blue" asset catalog color.
    static var lightBlue: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .lightBlue)
#else
        .init()
#endif
    }

    /// The "Midnight" asset catalog color.
    static var midnight: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .midnight)
#else
        .init()
#endif
    }

    #warning("The \"Orange\" color asset name resolves to a conflicting NSColor symbol \"orange\". Try renaming the asset.")

    /// The "Pink" asset catalog color.
    static var pink: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pink)
#else
        .init()
#endif
    }

    #warning("The \"Purple\" color asset name resolves to a conflicting NSColor symbol \"purple\". Try renaming the asset.")

    #warning("The \"Red\" color asset name resolves to a conflicting NSColor symbol \"red\". Try renaming the asset.")

    /// The "Teal" asset catalog color.
    static var teal: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .teal)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "Dark Blue" asset catalog color.
    static var darkBlue: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .darkBlue)
#else
        .init()
#endif
    }

    #warning("The \"Dark Gray\" color asset name resolves to a conflicting UIColor symbol \"darkGray\". Try renaming the asset.")

    /// The "Gold" asset catalog color.
    static var gold: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .gold)
#else
        .init()
#endif
    }

    #warning("The \"Gray\" color asset name resolves to a conflicting UIColor symbol \"gray\". Try renaming the asset.")

    #warning("The \"Green\" color asset name resolves to a conflicting UIColor symbol \"green\". Try renaming the asset.")

    /// The "Light Blue" asset catalog color.
    static var lightBlue: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .lightBlue)
#else
        .init()
#endif
    }

    /// The "Midnight" asset catalog color.
    static var midnight: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .midnight)
#else
        .init()
#endif
    }

    #warning("The \"Orange\" color asset name resolves to a conflicting UIColor symbol \"orange\". Try renaming the asset.")

    /// The "Pink" asset catalog color.
    static var pink: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pink)
#else
        .init()
#endif
    }

    #warning("The \"Purple\" color asset name resolves to a conflicting UIColor symbol \"purple\". Try renaming the asset.")

    #warning("The \"Red\" color asset name resolves to a conflicting UIColor symbol \"red\". Try renaming the asset.")

    /// The "Teal" asset catalog color.
    static var teal: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .teal)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "Dark Blue" asset catalog color.
    static var darkBlue: SwiftUI.Color { .init(.darkBlue) }

    /// The "Dark Gray" asset catalog color.
    static var darkGray: SwiftUI.Color { .init(.darkGray) }

    /// The "Gold" asset catalog color.
    static var gold: SwiftUI.Color { .init(.gold) }

    #warning("The \"Gray\" color asset name resolves to a conflicting Color symbol \"gray\". Try renaming the asset.")

    #warning("The \"Green\" color asset name resolves to a conflicting Color symbol \"green\". Try renaming the asset.")

    /// The "Light Blue" asset catalog color.
    static var lightBlue: SwiftUI.Color { .init(.lightBlue) }

    /// The "Midnight" asset catalog color.
    static var midnight: SwiftUI.Color { .init(.midnight) }

    #warning("The \"Orange\" color asset name resolves to a conflicting Color symbol \"orange\". Try renaming the asset.")

    #warning("The \"Pink\" color asset name resolves to a conflicting Color symbol \"pink\". Try renaming the asset.")

    #warning("The \"Purple\" color asset name resolves to a conflicting Color symbol \"purple\". Try renaming the asset.")

    #warning("The \"Red\" color asset name resolves to a conflicting Color symbol \"red\". Try renaming the asset.")

    #warning("The \"Teal\" color asset name resolves to a conflicting Color symbol \"teal\". Try renaming the asset.")

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "Dark Blue" asset catalog color.
    static var darkBlue: SwiftUI.Color { .init(.darkBlue) }

    /// The "Dark Gray" asset catalog color.
    static var darkGray: SwiftUI.Color { .init(.darkGray) }

    /// The "Gold" asset catalog color.
    static var gold: SwiftUI.Color { .init(.gold) }

    /// The "Light Blue" asset catalog color.
    static var lightBlue: SwiftUI.Color { .init(.lightBlue) }

    /// The "Midnight" asset catalog color.
    static var midnight: SwiftUI.Color { .init(.midnight) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

