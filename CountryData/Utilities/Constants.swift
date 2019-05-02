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
    
    public static let customQueueIdentifier = "com.main.countrydetails"
    
    public struct CellConstants {
        public static let cellIdentifier = "cell"
        public static let estimatedHeight: CGFloat = 44.0
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
    public struct ClosureConstants {
        public static let successDecodeMessage = NSLocalizedString("kSuccessDecodeMessage", comment: "Decoded data successfully")
        public static let unsuccessDecodeMessage = NSLocalizedString("kUnsuccessDecodeMessage", comment: "Decode unsuccessfull")
        public static let errorDataReceived = NSLocalizedString("kErrorDataReceived", comment: "Data error")
    }
    public struct ImageConstants {
        public static let defaultImage = "placeHolder"
    }
    public struct CustomActivityIndicatorConstants {
        public static let activityIndicatorMessage = NSLocalizedString("kActivityIndicatorMessage", comment: "Loading message")
    }
    public struct ImageURLConstants {
        public static let inValidImageUrl = "http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"
        public static let validImageUrl = "http://3.bp.blogspot.com/__mokxbTmuJM/RnWuJ6cE9cI/AAAAAAAAATw/6z3m3w9JDiU/s400/019843_31.jpg"
    }
}
