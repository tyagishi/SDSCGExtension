import XCTest
@testable import SDSCGExtension

final class SDSCGExtensionTests: XCTestCase {
    
    
    func test_adjustWidthKeepingSizeRatio_withoutMovingOrigin_onlySizeShouldBeAdjusted() throws {
        // (10,20) - (40,80)
        let rect = CGRect(x: 10, y: 20, width: 30, height: 60)
        let newRect = rect.adjustWidthKeepingSizeRatio(45 as CGFloat)
        XCTAssertEqual(rect.origin, newRect.origin)
        XCTAssertEqual(newRect.size.width, 45 as CGFloat)
        XCTAssertEqual(newRect.size.height, 90 as CGFloat)
    }
    
    func test_adjustHeightKeepingSizeRatio_withoutMovingOrigin_onlySizeShouldBeAdjusted() throws {
        let rect = CGRect(x: 10, y: 20, width: 30, height: 60)
        let newRect = rect.adjustHeightKeepingSizeRatio(40 as CGFloat)
        XCTAssertEqual(rect.origin, newRect.origin)
        XCTAssertEqual(newRect.size.width, 20 as CGFloat)
        XCTAssertEqual(newRect.size.height, 40 as CGFloat)
    }

}
