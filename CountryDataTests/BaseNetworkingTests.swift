//
//  BaseNetworkingTests.swift
//  CountryDataTests
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import XCTest
@testable import CountryData

class BaseNetworkingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    /// Possitive Test
    /// TEST BASE SERVICE - Data should not be Nil When Url is correct
    func testBaseServiceWithValidUrl() {
        let expect = expectation(description: "Download Should Succed")
        let url = AppConstants.ServiceURL.baseURL + AppConstants.ServiceURL.countryURL
        let baseService = BaseService.init(serviceType: .GET, serviceURL: url, requestData: nil)
        baseService.invokeService(completionHandler: { (_, data) in
            // "No data received" should be displayed when URL is valid but data is nil.
            XCTAssertNotNil(data, "No data received")
            // When Url is valid and data is not nil, then expect fulfill.
            expect.fulfill()
        }, failurehandler: { (status, error) in
            XCTAssertNil(error, "Error Occured \(String(describing: error?.localizedDescription))")
            XCTAssertEqual(status, false, "Wrong Failute status")
        })
        self.waitForExpectations(timeout: AppConstants.HttpConstants.timeOut) { (error) in
            XCTAssertNil(error, "Test Timed Out \(String(describing: error?.localizedDescription))")
        }
    }
    
    /// Possitive Test
    /// TEST BASE SERVICE - Data should be Nil, error status should be false wshen Url is incorrect
    func testBaseServiceWithInValidUrl() {
        let expect = expectation(description: "Download Should Fail")
        let url = AppConstants.ServiceURL.baseURL + AppConstants.ServiceURL.invalidCountryURL
        let baseService = BaseService.init(serviceType: .GET, serviceURL: url, requestData: nil)
        baseService.invokeService(completionHandler: { (_, data) in
            XCTAssertNil(data, "Data received")
        }, failurehandler: { (status, error) in
            // "Wrong Failure status" should be displayed when URL is invalid but status is true
            XCTAssertNotNil(error, "No error received ")
            XCTAssertEqual(status, false, "Wrong Failute status")
            expect.fulfill()
        })
        self.waitForExpectations(timeout: AppConstants.HttpConstants.timeOut) { (error) in
            XCTAssertNil(error, "Test Timed Out \(String(describing: error?.localizedDescription))")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
