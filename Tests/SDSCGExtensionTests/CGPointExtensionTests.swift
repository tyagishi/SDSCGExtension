@testable import  SDSCGExtension
import XCTest

final class SDSCGPointExtensionTests: XCTestCase {
    func test_OperatorWithVector() throws {
        var point = CGPoint(x: 20, y: 50)
        let vector = CGVector(dx: 10, dy: 30)
        XCTAssertEqual(point + vector, CGPoint(x: 30, y: 80))
    }
    
    func test_map_betweenSameRegion() throws {
        let fromRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600))
        let toRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600))
        let checkLL = CGPoint(x:   0, y:   0)
        let checkLR = CGPoint(x: 800, y:   0)
        let checkUL = CGPoint(x:   0, y: 600)
        let checkUR = CGPoint(x: 800, y: 600)
        let center  = CGPoint(x: 400, y: 300)

        XCTAssertEqual(checkLL.map(from: fromRect, to: toRect), checkLL)
        XCTAssertEqual(checkLR.map(from: fromRect, to: toRect), checkLR)
        XCTAssertEqual(checkUL.map(from: fromRect, to: toRect), checkUL)
        XCTAssertEqual(checkUR.map(from: fromRect, to: toRect), checkUR)
        XCTAssertEqual(center.map(from: fromRect, to: toRect), center)
    }
    
    // MARK: test transition
    func test_map_shrinkArea_AlongX() throws {
        let fromRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600))
        let toRect = CGRect(origin: CGPoint(x: 100, y: 0), size: CGSize(width: 700, height: 600))
        let check1 = CGPoint(x: 0, y: 0)
        XCTAssertEqual(check1.map(from: fromRect, to: toRect), CGPoint(x: -100, y: 0))
    }
    func test_map_shrinkArea_AlongY() throws {
        let fromRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600))
        let toRect = CGRect(origin: CGPoint(x: 0, y: 200), size: CGSize(width: 800, height: 400))
        let check1 = CGPoint(x: 0, y: 0)
        XCTAssertEqual(check1.map(from: fromRect, to: toRect), CGPoint(x: 0, y: -200))
    }
    func test_map_shrinkArea_AlongXY() throws {
        let fromRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600))
        let toRect = CGRect(origin: CGPoint(x: 300, y: 200), size: CGSize(width: 500, height: 400))
        let check1 = CGPoint(x: 0, y: 0)
        XCTAssertEqual(check1.map(from: fromRect, to: toRect), CGPoint(x: -300, y: -200))
    }
    
    // MARK: test scaling
    func test_map_scaling_alongX() throws {
        let fromRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600))
        let toRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 400, height: 600))
        let check1 = CGPoint(x: 50, y: 50)
        XCTAssertEqual(check1.map(from: fromRect, to: toRect), CGPoint(x: 50, y: 50))
    }
}
