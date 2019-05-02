//
//  ServiceProtocol.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation

protocol DataReceiver {
    /// Fetch Country lists
    ///
    /// - Parameters:
    ///   - completionHandler: success closure
    ///   - failureHandler: failure closure
    func fetchCountryDataList(completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure)
}
