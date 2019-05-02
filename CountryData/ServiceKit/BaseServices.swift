//
//  BaseServices.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation
import Alamofire

public typealias HTTPHeaders = [String: String]

open class BaseService: NSObject {
    
    /// instance of NSData that holds response data
    open var responseData: NSData!
    /// deafult header of the request
    open var defaultHeaders: [String: String] = [:]
    /// serviceType for the type of the service
    open var serviceType: ServiceType!
    /// serviceURL for the request URL
    open var serviceURL: String = ""
    /// headers for including type and API Key
    open var headers: HTTPHeaders = [
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    /// Purpose of this method is to initialization
    public override init() {
        super.init()
    }
    
    /// Initializers for this BaseService Class
    public convenience init(serviceType: ServiceType, serviceURL: String, requestData: Data? = nil) {
        self.init()
        self.serviceURL = serviceURL
        self.serviceType = serviceType
    }
    
    open func invokeService(completionHandler:@escaping SuccessDataClosure, failurehandler:@escaping FailureDataClosure) {
        print("\n\n")
        print("You are into Base Service Class")
        print("\n")
        print("========= URL Request Details ===============")
        print("==============================================")
        
        let url: String = self.serviceURL
        
        let request = Alamofire.request(url,
                                        method: Alamofire.HTTPMethod.get,
                                        parameters: nil,
                                        encoding: JSONEncoding.default,
                                        headers: nil)
        Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = AppConstants.HttpConstants.timeOut
        Alamofire.SessionManager.default.session.configuration.urlCache = nil
        
        ///handling the response from the request
        request.responseData(completionHandler: {(response) in
            switch response.result {
            case .success:
                if let responseStatusCode = response.response?.statusCode {
                    if responseStatusCode != AppConstants.HttpConstants.httpOK {
                        let error = NSError(domain: AppConstants.HttpConstants.httpError, code: responseStatusCode)
                        failurehandler(false, error)
                        return
                    }
                }
                if let responseData = response.result.value {
                    let dataString = String(data: responseData, encoding: String.Encoding.isoLatin1)
                    guard let responseData = dataString?.data(using: String.Encoding.utf8) else {
                        let error = NSError(domain: AppConstants.HttpConstants.httpError, code: 400)
                        failurehandler(false, error)
                        return
                    }
                    debugPrint("Response code ------>", response.response?.statusCode as Any)
                    debugPrint("Response Data ------->", response.result)
                    completionHandler(true, responseData)
                }
            case .failure(let error as NSError):
                failurehandler(false, error.localizedDescription as? Error)
            }
        })
    }
    
}
