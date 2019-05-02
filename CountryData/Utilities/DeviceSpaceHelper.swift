//
//  DeviceSpaceHelper.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description - Calculate device free space

import Foundation
import UIKit

class CalculateDeviceFreeSpace: NSObject {
    
    /// Calculate device free space
    ///
    /// - Returns: free space in MB
    class func deviceRemainingFreeSpaceInMegaBytes() -> Int64? {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: documentDirectory),
            let freeSize = systemAttributes[.systemFreeSize] as? NSNumber
            else {
                // something failed
                debugPrint(AppConstants.DeviceSpaceConstants.internalDeviceSpaceCalculationFailure)
                return nil
        }
        let freeSizeBytes = freeSize.int64Value
        debugPrint("free space: \(freeSizeBytes)")
        let bytesMB = (freeSizeBytes / 1024) / 1024
        debugPrint("Free space in MB = \(bytesMB)")
        return bytesMB
    }
}
