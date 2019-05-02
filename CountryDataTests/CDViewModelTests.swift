//
//  CDViewModelTests.swift
//  CountryDataTests
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import XCTest
@testable import CountryData

class CDViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Possitive Test
    /// TEST VIEWMODEL - JSON parsing should occur correctly and provide the parsed response data without error
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
        
        self.waitForExpectations(timeout: AppConstants.HttpConstants.timeOut, handler: { (error) in
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
                let actualDataArray = responseData.rows
                let filleredDataArray = actualDataArray?.filter {(($0.rdescription != nil) || ($0.rtitle != nil) || ($0.rimageHref != nil))}
                let difference = (actualDataArray?.count ?? 0) - (filleredDataArray?.count ?? 0)
                XCTAssertEqual(filleredDataArray?.count, (actualDataArray?.count)! - difference, "Wrong Filteration")
                expect.fulfill()
            } catch {
                XCTFail("error while Filtering Data \(error.localizedDescription)")
            }
        }, failureHandler: { (_, error) in
            XCTAssertNil(error, "Error Occured \(String(describing: error?.localizedDescription))")
        })
        self.waitForExpectations(timeout: AppConstants.HttpConstants.timeOut, handler: { (error) in
            XCTAssertNil(error, "Filter Timed Out \(String(describing: error?.localizedDescription))")
        })
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
