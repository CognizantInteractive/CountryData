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
    }
    override func tearDown() {
    }
    // Negetive Test
    // TEST TABLEVIEW CEll: sd_setImage should not return error with valid image url
    func testImageDownloadWithValidUrl() {
        let expect = expectation(description: "return no error with valid image url expectation")
        let tableViewCell = CDTableViewCell()
        let baseImageUrl = AppConstants.ImageURLConstants.baseImageUrl
        let validImageUrl = baseImageUrl + AppConstants.ImageURLConstants.validImageUrl
        let photoUrl = URL(string: validImageUrl)
        let defaultImage = UIImage(named: AppConstants.ImageConstants.defaultImage)
        tableViewCell.photoImageView.sd_setImage(with: photoUrl,
                                                 placeholderImage: defaultImage) { (_, error, _, _) in
            XCTAssertNil(error, "Error found")
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
        let defaultImage = UIImage(named: AppConstants.ImageConstants.defaultImage)
        tableViewCell.photoImageView.sd_setImage(with: photoUrl,
                                                 placeholderImage: defaultImage) { (_, error, _, _) in
            XCTAssertNotNil(error, "No error")
            expect.fulfill()
        }
        self.waitForExpectations(timeout: 30.0, handler: nil)
    }
}
