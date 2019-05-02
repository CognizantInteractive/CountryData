//
//  CDViewControllerTests.swift
//  CountryDataTests
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description - ViewController Unit Tests

import XCTest
@testable import CountryData

class CDViewControllerTests: XCTestCase {
    override func setUp() {
    }
    override func tearDown() {
    }
    // Possitive Test
    // TEST VIEWCONTROLLER:  Should return correct success/failure status and message
    func testFetchDataUsingViewModel() {
        let expect = expectation(description: "Correct success/failure status and message")
        let viewController = CDViewController()
        viewController.tvViewModel.getTVList(completionHandler: { (status, message) in
            let sucessMessage = AppConstants.ClosureConstants.successDecodeMessage
            XCTAssertEqual(message, sucessMessage, "Different Success Message")
            XCTAssertEqual(status, true, "Different Success Status")
            expect.fulfill()
        }, failureHandler: { (status, _) in
            XCTAssertEqual(status, false, "Different Failure Status")
        })
        self.waitForExpectations(timeout: AppConstants.HttpConstants.timeOut, handler: { (error) in
            XCTAssertNil(error, "Timed Out \(String(describing: error?.localizedDescription))")
        })
    }
    // Possitive Test
    // TEST VIEWCONTROLLER:  Should return correct success/failure status and message upon refreshing
    func testRefreshControll() {
        let expect = expectation(description: "Correct Refresh success/failure status and message")
        let viewController = CDViewController()
        viewController.getTableViewDataWhenRefreshed(completionHandler: { (status, message) in
            let successMessage = AppConstants.AlertConstants.alertRefreshSuccess
            XCTAssertEqual(status, true, "Wrong status displayed")
            XCTAssertEqual(message, successMessage, "Wrong message displayed")
            expect.fulfill()
        }, failureHandler: { (status, message) in
            let failureMessage = AppConstants.AlertConstants.alertRefreshFailure
            XCTAssertEqual(status, false, "Wrong status displayed")
            XCTAssertEqual(message, failureMessage, "Wrong message displayed")
        })
        self.waitForExpectations(timeout: AppConstants.HttpConstants.timeOut, handler: { (error) in
            XCTAssertNil(error, "Timed Out \(String(describing: error?.localizedDescription))")
        })
    }
    // Possitive Test
    // TEST VIEWCONTROLLER:  Should fetch data using viewmodel and
    //                         return correct success/failure status and message upon refreshing
    func testFetchDataWithViewModel() {
        let expect = expectation(description: "Correct fetch Data success/failure status and message expectations")
        let viewController = CDViewController()
        let succesMessage = AppConstants.AlertConstants.alertRefreshSuccess
        viewController.fetchDataUsingViewModel(completionHandler: { (status, message) in
            XCTAssertEqual(status, true, "Incorrect status")
            XCTAssertEqual(message, succesMessage, "Incorrect status message")
            expect.fulfill()
        }, failureHandler: { (status, _) in
            XCTAssertEqual(status, false, "Incorrect status")
        })
        self.waitForExpectations(timeout: AppConstants.HttpConstants.timeOut, handler: { (error) in
            XCTAssertNil(error, "Timed Out \(String(describing: error?.localizedDescription))")
        })
    }
}
