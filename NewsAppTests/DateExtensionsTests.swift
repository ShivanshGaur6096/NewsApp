//
//  DateExtensionsTests.swift
//  NewsAppTests
//
//  Created by Shivansh Gaur on 05/04/22.
//

import XCTest
@testable import NewsApp

class DateExtensionsTest: XCTestCase {

    func testRedableDateFormat() {
        let receivedDate = "2022-04-02T15:35:06Z"
        let redableDateFormat = Date.redableDateFormat(urlDate: receivedDate)
        XCTAssertEqual(redableDateFormat, "02-04-2022 03:35 PM")
    }

    func testReturnPreviousDate() {
        let returnPreviousDate = Date.returnPreviousDate()
        XCTAssertNotNil(returnPreviousDate)
    }

    func testReturnCurrentDate() {
        let returnCurrentDate = Date.returnCurrentDate()
        XCTAssertNotNil(returnCurrentDate)
    }
}
