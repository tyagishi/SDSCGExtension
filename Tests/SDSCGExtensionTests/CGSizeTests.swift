//
//  CGSizeTests.swift
//
//  Created by : Tomoaki Yagishita on 2024/09/09
//  © 2024  SmallDeskSoftware
//

import XCTest
@testable import SDSCGExtension

final class CGSizeTests: XCTestCase {

    func test_plus() async throws {
        let oneTwo = CGSize(width: 1, height: 2)
        let fiveSix = CGSize(width: 5, height: 6)
        
        XCTAssertEqual(oneTwo + fiveSix, CGSize(width: 6, height: 8))
    }
    func test_plusEqual() async throws {
        var oneTwo = CGSize(width: 1, height: 2)
        let fiveSix = CGSize(width: 5, height: 6)

        oneTwo += fiveSix
        
        XCTAssertEqual(oneTwo, CGSize(width: 6, height: 8))
    }
    
    func test_rounded() async throws {
        let case1 = CGSize(width: 1.1, height: 2.9)
        let case2 = CGSize(width: -5.001, height: -5.9999)

        XCTAssertEqual(case1.rounded(.awayFromZero), CGSize(width: 2, height: 3))
        XCTAssertEqual(case2.rounded(.awayFromZero), CGSize(width: -6, height: -6))
    }
}
