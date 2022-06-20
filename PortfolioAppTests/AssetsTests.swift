//
//  AssetsTests.swift
//  PortfolioAppTests
//
//  Created by Mateusz Kuznik on 17/06/2022.
//

import XCTest
@testable import PortfolioApp

class AssetsTests: XCTestCase {

    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }

    func testJSONLoadsCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }

}
