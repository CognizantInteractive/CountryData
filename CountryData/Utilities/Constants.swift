//
//  Constants.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation
import UIKit

public struct AppConstants {
    
    public struct CellConstants {
        public static let cellIdentifier = "cell"
        public static let estimatedHeight: CGFloat = 44.0
    }
    
    public struct AlertConstants {
        public static let alertHeader = NSLocalizedString("kAlertHeader", comment: "Alert header")
        public static let alertOffLineMessage = NSLocalizedString("kAlertOffLineMessage", comment: "offline alert")
        public static let alertActionOk = NSLocalizedString("kAlertActionOk", comment: "Ok")
        public static let alertFetchFailure = NSLocalizedString("kAlertFetchFailure", comment: "Data fetch failure")
        public static let alertRefreshFailure = NSLocalizedString("kRefreshfailure", comment: "refresh failure")
        public static let alertRefreshSuccess = NSLocalizedString("kRefreshSuccess", comment: "refresh success")
    }
    
    public struct ImageConstants {
        public static let defaultImage = "placeHolder"
    }
    
    public struct ClosureConstants {
        public static let successDecodeMessage = NSLocalizedString("kSuccessDecodeMessage", comment: "Decoded data successfully")
        public static let unsuccessDecodeMessage = NSLocalizedString("kUnsuccessDecodeMessage", comment: "Decode unsuccessfull")
        public static let errorDataReceived = NSLocalizedString("kErrorDataReceived", comment: "Data error")
    }
    
    public struct RecabilityConstants {
        public static let networkOnNotificationKey = NSLocalizedString("kNetworkOnNotificationKey", comment: "Notification on")
        public static let networkOffNotificationKey = NSLocalizedString("kNetworkOffNotificationKey", comment: "Notification off")
    }
    
    public struct CustomActivityIndicatorConstants {
        public static let activityIndicatorMessage = NSLocalizedString("kActivityIndicatorMessage", comment: "Loading message")
    }
    
    public struct DeviceSpaceConstants {
        public static let alertToFreeSpace = NSLocalizedString("kAlertToFreeSpace", comment: "Free space alert")
        public static let deviceSpaceFailure = NSLocalizedString("kDeviceSpaceFailure", comment: "Device space return failure")
        public static let internalDeviceSpaceCalculationFailure = NSLocalizedString("kInternalDeviceSpaceCalculationFailure", comment: "Space caltulation error")
    }
    
    public struct ImageURLConstants {
        public static let inValidImageUrl = "http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"
        public static let validImageUrl = "http://3.bp.blogspot.com/__mokxbTmuJM/RnWuJ6cE9cI/AAAAAAAAATw/6z3m3w9JDiU/s400/019843_31.jpg"
    }
    
    public struct ServiceURL {
        public static let baseURL = "https://dl.dropboxusercontent.com/"
        public static let countryURL = "s/2iodh4vg0eortkl/facts.json"
        public static let invalidCountryURL = "s/2iodh4vg0eortkl/"
    }
    
    public struct HttpConstants {
        public static let httpOK = 200
        public static let timeOut = 30.0
        public static let httpError = "HTTP Error"
    }
    
    public static let minimumFreeSpace = 30
    public static let customQueueIdentifier = "com.main.countrydetails"
}
