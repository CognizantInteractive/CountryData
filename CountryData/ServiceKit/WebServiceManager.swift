//
//  WebServiceManager.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation

class WebServiceManager: DataReceiver {
    /// Fetch Country lists
    ///
    /// - Parameters:
    ///   - completionHandler: success closure
    ///   - failureHandler: failure closure
    func fetchCountryDataList(completionHandler: @escaping SuccessDataClosure, failureHandler: @escaping FailureDataClosure) {
        let url = AppConstants.ServiceURL.baseURL + AppConstants.ServiceURL.countryURL
        let baseService = BaseService(serviceType: .GET, serviceURL: url, requestData: nil)
        baseService.invokeService(completionHandler: { (status, data) in
            completionHandler(status, data)
        }, failurehandler: { (status, error) in
            failureHandler(status, error)
        })
    }
}
