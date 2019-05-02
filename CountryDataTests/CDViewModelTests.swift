//
//  CDViewModelTests.swift
//  CountryDataTests
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description - ViewModel Unit tests

import XCTest
@testable import CountryData

class CDViewModelTests: XCTestCase {
    override func setUp() {
    }
    override func tearDown() {
    }
    /// Possitive Test
    /// TEST VIEWMODEL - JSON parsing should occur correctly and
    //                    provide the parsed response data without error
    func testParshingDataInViewModel() {
        let expect = expectation(description: "Country List Data Parse Expectation")
        let webServiceManger = WebServiceManager()
        webServiceManger.fetchCountryDataList(completionHandler: { (status, data) in
            XCTAssertEqual(status, true)
            do {
                let responseData = try JSONDecoder().decode(TLResponseModel.self, from: data!)
                XCTAssertNotNil(responseData)
                expect.fulfill()
            } catch {
                XCTFail("error while Parsing \(error.localizedDescription)")
            }
        }, failureHandler: { (status, error) in
            XCTAssertEqual(status, false)
            XCTAssertNil(error, "Error Occured \(String(describing: error?.localizedDescription))")
        })
        self.waitForExpectations(timeout: AppConstants.Http.timeOut, handler: { (error) in
            XCTAssertNil(error, "Parse Timed Out \(String(describing: error?.localizedDescription))")
        })
    }
    /// Negetive Test
    /// TEST VIEWMODEL - Country table view datasource array should not have nil data
    func testDataSourceArrayWithAllNil() {
        let expect = expectation(description: "Country List should not have nil data Expectation")
        let webServiceManger = WebServiceManager()
        webServiceManger.fetchCountryDataList(completionHandler: { (status, data) in
            XCTAssertEqual(status, true)
            do {
                let responseData = try JSONDecoder().decode(TLResponseModel.self, from: data!)
                let actualArray = responseData.rows
                let filterArray = actualArray?.filter {
                        ($0.rdescription != nil) ||
                        ($0.rtitle != nil) ||
                        ($0.rimageHref != nil)
                }
                let diff = (actualArray?.count ?? 0) - (filterArray?.count ?? 0)
                XCTAssertEqual(filterArray?.count, (actualArray?.count)! - diff, "Wrong Filter")
                expect.fulfill()
            } catch {
                XCTFail("error while Filtering Data \(error.localizedDescription)")
            }
        }, failureHandler: { (_, error) in
            XCTAssertNil(error, "Error Occured \(String(describing: error?.localizedDescription))")
        })
        self.waitForExpectations(timeout: AppConstants.Http.timeOut, handler: { (error) in
            XCTAssertNil(error, "Filter Timed Out \(String(describing: error?.localizedDescription))")
        })
    }
}
