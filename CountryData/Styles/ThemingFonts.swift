//
//  ThemingFonts.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation
import UIKit

/// Constants Value for Fonts
struct Fonts {
    static let OpenSansBold = "OpenSans-Bold"
    static let OpenSansBoldItalic = "OpenSans-BoldItalic"
    static let OpenSansExtraBold = "OpenSans-ExtraBold"
    static let OpenSansExtraBoldItalic = "OpenSans-ExtraBoldItalic"
    static let OpenSansItalic = "OpenSans-Italic"
    static let OpenSansLight = "OpenSans-Light"
    static let OpenSansLightItalic = "OpenSans-LightItalic"
    static let OpenSansRegular = "OpenSans-Regular"
    static let OpenSansSemiBold = "OpenSans-SemiBold"
    static let OpenSansSemiBoldItalic = "OpenSans-SemiBoldItalic"
    
    static let LatoBlack = "Lato-Black"
    static let LatoBlackItalic = "Lato-BlackItalic"
    static let LatoBold = "Lato-Bold"
    static let LatoBoldItalic = "Lato-BoldItalic"
    static let LatoHairline = "Lato-Hairline"
    static let LatoHairlineItalic = "Lato-HairlineItalic"
    static let LatoItalic = "Lato-Italic"
    static let LatoLight = "Lato-Light"
    static let LatoLightItalic = "Lato-LightItalic"
    static let LatoRegular = "Lato-Regular"
    
}

struct TypeFace {
    static let OpenSansBoldItalic = Fonts.OpenSansBoldItalic
    static let OpenSansBold = Fonts.OpenSansBold
    static let OpenSansSemibold = Fonts.OpenSansSemiBold
    static let OpenSansRegular = Fonts.OpenSansRegular
    
    static let LatoRegular = Fonts.LatoRegular
    static let LatoMedium = Fonts.LatoBlack
    static let LatoSemiBold = Fonts.LatoBlack
    static let LatoBold = Fonts.LatoBold
}

class ThemingFont: UIFont {
    // MARK: - Label Fonts
    class func primaryLabelFont() -> UIFont {
        return UIFont(name: TypeFace.OpenSansSemibold, size: 24.0)!
    }
    class func secondarylabelFont() -> UIFont {
        return UIFont(name: TypeFace.OpenSansSemibold, size: 16.0)!
    }
}
