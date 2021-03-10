import XCTest
@testable import SDSCGExtension

final class SDSCGExtensionTests: XCTestCase {
    
    
    func test_moveBottomRightCornerToNewWidthKeepingSizeRatio_NA_onlySizeShouldBeAdjusted() throws {
        // (10,20) - (40,80)
        let rect = CGRect(x: 10, y: 20, width: 30, height: 60)
        let newRect = rect.moveBottomRightCornerToNewWidthKeepingSizeRatio(45 as CGFloat)
        XCTAssertEqual(newRect.origin, rect.origin)
        XCTAssertEqual(newRect.size.width, 45 as CGFloat)
        XCTAssertEqual(newRect.size.height, 90 as CGFloat)
    }
    
    func test_moveBottomRightCornerToNewHeightKeepingSizeRatio_NA_onlySizeShouldBeAdjusted() throws {
        let rect = CGRect(x: 10, y: 20, width: 30, height: 60)
        let newRect = rect.moveBottomRightCornerToNewHeightKeepingSizeRatio(40 as CGFloat)
        XCTAssertEqual(newRect.origin, rect.origin)
        XCTAssertEqual(newRect.size.width, 20 as CGFloat)
        XCTAssertEqual(newRect.size.height, 40 as CGFloat)
    }

    func test_moveBottomLeftCornerToNewWidthKeepingSizeRatio_NA_SizeAndOriginXShouldBeAdjusted() throws {
        let rect = CGRect(x: 10, y: 20, width: 30, height: 60)
        let newRect = rect.moveBottomLeftCornerToNewWidthKeepingSizeRatio(45 as CGFloat)
        XCTAssertEqual(newRect.origin.x, -5)
        XCTAssertEqual(newRect.origin.y, 20)
        XCTAssertEqual(newRect.size.width, 45 as CGFloat)
        XCTAssertEqual(newRect.size.height, 90 as CGFloat)
    }

    func test_moveBottomLeftCornerToNewHeightKeepingSizeRatio_NA_SizeAndOriginXShouldBeAdjusted() throws {
        let rect = CGRect(x: 10, y: 20, width: 30, height: 60)
        let newRect = rect.moveBottomLeftCornerToNewHeightKeepingSizeRatio(90 as CGFloat)
        XCTAssertEqual(newRect.origin.x, -5)
        XCTAssertEqual(newRect.origin.y, 20)
        XCTAssertEqual(newRect.size.width, 45 as CGFloat)
        XCTAssertEqual(newRect.size.height, 90 as CGFloat)
    }

}
