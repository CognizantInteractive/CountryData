//
//  AlertController.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description - Alert Controller

import Foundation
import UIKit

extension UIAlertController {
    // Showing Alert with Title and Message
    static func showAlertWith(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(
            title: AppConstants.AlertConstants.alertActionOk,
            style: .default, handler: nil))
        return alertVC
    }
}
