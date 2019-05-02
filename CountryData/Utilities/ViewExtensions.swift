//
//  ViewExtensions.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description - This file is used for extending Views and IBInspectable properties.

import Foundation
import UIKit

extension UIView {
    /// For binding frame to superView
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            debugPrint("Error! `superview` is nil")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 12).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -12).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -12).isActive = true
    }
    /// For binding view
    ///
    /// - Parameter withConstant: constraint constants
    func bindViewToSuperviewBounds(withConstant: CGFloat) {
        guard let superview = self.superview else {
            debugPrint("Error! `superview` is nil")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: withConstant).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: withConstant).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -withConstant).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -withConstant).isActive = true
    }
}

@IBDesignable
open class CustomView: UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
