//
//  ServiceHelper.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description - Service helpers

import Foundation
import UIKit

public typealias SuccessClosure = (_ status: Bool, _ data: String) -> Void
public typealias FailureClosure = (_ status: Bool, _ error: String) -> Void

public typealias SuccessDataClosure = (_ status: Bool, _ data: Data?) -> Void
public typealias FailureDataClosure = (_ status: Bool, _ error: Error?) -> Void

public enum ServiceType: String {
    case GET
    case POST
    case PUT
    case DELETE
}
