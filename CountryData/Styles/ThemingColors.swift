//
//  ThemingColors.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation
import UIKit

/// Theming Class for Colors
class ThemingColors: UIColor {
    
    // MARK: - Style
    class func globalGreyColor() -> UIColor {
        return UIColor(hexString: "808080")!
    }
    class func globalBlackColor() -> UIColor {
        return UIColor(hexString: "000000")!
    }
    class func globalWhiteColor() -> UIColor {
        return UIColor(hexString: "F2F2F2")!
    }
}

extension UIColor {
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init?(hexString: String) {
        guard let hex = hexString.hexColorString else {
            return nil
        }
        self.init(hex: hex)
    }
}
extension String {
    var hexColorString: Int? {
        return Int(self, radix: 16)
    }
}
