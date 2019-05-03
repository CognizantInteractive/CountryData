//
//  AlertControllerTest.swift
//  CountryDataTests
//
//  Created by CTS iMac Sierra on 03/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import XCTest
@testable import CountryData

class AlertControllerTest: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    // Possitive Test
    // ALERT CONTROLLER:  Should return alertVC
    func testAlertController() {
        let message = AppConstants.AlertConstants.alertRefreshFailure
        let alertVc = UIAlertController.showAlertWith(title: "Alert", message: message)
        XCTAssertNotNil(alertVc)
    }
}
