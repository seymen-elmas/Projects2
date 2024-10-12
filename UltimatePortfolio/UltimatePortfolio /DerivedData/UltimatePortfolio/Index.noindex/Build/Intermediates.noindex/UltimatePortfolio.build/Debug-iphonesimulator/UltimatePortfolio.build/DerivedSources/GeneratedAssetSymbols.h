#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.seymenelmas.UltimatePortfolio";

/// The "Dark Blue" asset catalog color resource.
static NSString * const ACColorNameDarkBlue AC_SWIFT_PRIVATE = @"Dark Blue";

/// The "Dark Gray" asset catalog color resource.
static NSString * const ACColorNameDarkGray AC_SWIFT_PRIVATE = @"Dark Gray";

/// The "Gold" asset catalog color resource.
static NSString * const ACColorNameGold AC_SWIFT_PRIVATE = @"Gold";

/// The "Gray" asset catalog color resource.
static NSString * const ACColorNameGray AC_SWIFT_PRIVATE = @"Gray";

/// The "Green" asset catalog color resource.
static NSString * const ACColorNameGreen AC_SWIFT_PRIVATE = @"Green";

/// The "Light Blue" asset catalog color resource.
static NSString * const ACColorNameLightBlue AC_SWIFT_PRIVATE = @"Light Blue";

/// The "Midnight" asset catalog color resource.
static NSString * const ACColorNameMidnight AC_SWIFT_PRIVATE = @"Midnight";

/// The "Orange" asset catalog color resource.
static NSString * const ACColorNameOrange AC_SWIFT_PRIVATE = @"Orange";

/// The "Pink" asset catalog color resource.
static NSString * const ACColorNamePink AC_SWIFT_PRIVATE = @"Pink";

/// The "Purple" asset catalog color resource.
static NSString * const ACColorNamePurple AC_SWIFT_PRIVATE = @"Purple";

/// The "Red" asset catalog color resource.
static NSString * const ACColorNameRed AC_SWIFT_PRIVATE = @"Red";

/// The "Teal" asset catalog color resource.
static NSString * const ACColorNameTeal AC_SWIFT_PRIVATE = @"Teal";

#undef AC_SWIFT_PRIVATE
