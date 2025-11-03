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
    
    func test_rounded_up() async throws {
        let size1 = CGSize(width: 1.1, height: 2.3)
        let size2 = CGSize(width: -1.1, height: -2.3)
        let size3 = CGSize(width: 1.0, height: 2.0)
        
        XCTAssertEqual(size1.rounded(.up), CGSize(width: 2, height: 3))
        XCTAssertEqual(size2.rounded(.up), CGSize(width: -1, height: -2))
        XCTAssertEqual(size3.rounded(.up), CGSize(width: 1, height: 2))
    }
    
    func test_rounded_down() async throws {
        let size1 = CGSize(width: 1.9, height: 2.8)
        let size2 = CGSize(width: -1.9, height: -2.8)
        let size3 = CGSize(width: 1.0, height: 2.0)
        
        XCTAssertEqual(size1.rounded(.down), CGSize(width: 1, height: 2))
        XCTAssertEqual(size2.rounded(.down), CGSize(width: -2, height: -3))
        XCTAssertEqual(size3.rounded(.down), CGSize(width: 1, height: 2))
    }
    
    func test_rounded_towardZero() async throws {
        let size1 = CGSize(width: 1.9, height: 2.8)
        let size2 = CGSize(width: -1.9, height: -2.8)
        let size3 = CGSize(width: 1.0, height: 2.0)
        
        XCTAssertEqual(size1.rounded(.towardZero), CGSize(width: 1, height: 2))
        XCTAssertEqual(size2.rounded(.towardZero), CGSize(width: -1, height: -2))
        XCTAssertEqual(size3.rounded(.towardZero), CGSize(width: 1, height: 2))
    }
    
    func test_rounded_toNearestOrEven() async throws {
        let size1 = CGSize(width: 1.5, height: 2.5)
        let size2 = CGSize(width: 3.5, height: 4.5)
        let size3 = CGSize(width: 1.4, height: 2.6)
        let size4 = CGSize(width: -1.5, height: -2.5)
        
        XCTAssertEqual(size1.rounded(.toNearestOrEven), CGSize(width: 2, height: 2))
        XCTAssertEqual(size2.rounded(.toNearestOrEven), CGSize(width: 4, height: 4))
        XCTAssertEqual(size3.rounded(.toNearestOrEven), CGSize(width: 1, height: 3))
        XCTAssertEqual(size4.rounded(.toNearestOrEven), CGSize(width: -2, height: -2))
    }
    
    func test_rounded_toNearestOrAwayFromZero() async throws {
        let size1 = CGSize(width: 1.5, height: 2.5)
        let size2 = CGSize(width: 1.4, height: 2.6)
        let size3 = CGSize(width: -1.5, height: -2.5)
        let size4 = CGSize(width: 1.0, height: 2.0)
        
        XCTAssertEqual(size1.rounded(.toNearestOrAwayFromZero), CGSize(width: 2, height: 3))
        XCTAssertEqual(size2.rounded(.toNearestOrAwayFromZero), CGSize(width: 1, height: 3))
        XCTAssertEqual(size3.rounded(.toNearestOrAwayFromZero), CGSize(width: -2, height: -3))
        XCTAssertEqual(size4.rounded(.toNearestOrAwayFromZero), CGSize(width: 1, height: 2))
    }
}
