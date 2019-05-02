//
//  CDTableViewCellTests.swift
//  CountryDataTests
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description  - Table view cell Unit tests

import XCTest
@testable import CountryData

class CDTableViewCellTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    // Negetive Test
    // TEST TABLEVIEW CEll: sd_setImage should not return error with valid image url
    func testImageDownloadWithValidUrl() {
        let expect = expectation(description: "return no error with valid image url expectation")
        let tableViewCell = CDTableViewCell()
        let validImageUrl = AppConstants.ImageURLConstants.validImageUrl
        let photoUrl = URL(string: validImageUrl)
        let placeholderImage = UIImage(named: AppConstants.ImageConstants.defaultImage)
        tableViewCell.photoImageView.sd_setImage(with: photoUrl, placeholderImage: placeholderImage, options: [.continueInBackground, .progressiveDownload]) { (_, error, _, _) in
            XCTAssertNil(error, "Error received: \(String(describing: error?.localizedDescription))")
            expect.fulfill()
        }
        self.waitForExpectations(timeout: 10.0, handler: { (error) in
            XCTAssertNil(error, "Timed Out \(String(describing: error?.localizedDescription))")
        })
    }
    
    // Possitive Test
    // TEST TABLE VIEW CEll:  sd_setImage should return error with invalid image url
    func testImageDownloadWithInvalidUrl() {
        let expect = expectation(description: "return error with invalid image url expectation")
        let tableViewCell = CDTableViewCell()
        let inValidImageUrl = AppConstants.ImageURLConstants.inValidImageUrl
        let photoUrl = URL(string: inValidImageUrl)
        let placeholderImage = UIImage(named: AppConstants.ImageConstants.defaultImage)
        tableViewCell.photoImageView.sd_setImage(with: photoUrl, placeholderImage: placeholderImage, options: [.continueInBackground, .progressiveDownload]) { (_, error, _, _) in
            XCTAssertNotNil(error, "No error received")
            expect.fulfill()
        }
        self.waitForExpectations(timeout: 30.0, handler: nil)
    }

}
