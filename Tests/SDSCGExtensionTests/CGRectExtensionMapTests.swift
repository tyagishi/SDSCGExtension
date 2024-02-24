@testable import SDSCGExtension
import XCTest

final class CGRectExtensionMapTests: XCTestCase {
    // [ a  b 0]
    // [ c  d 0]
    // [tx ty 1]
    func test_map_move() throws {
        let rect1 = CGRect(x: 10, y: 20, width: 300, height: 200)
        let rect2 = CGRect(x: 25, y: 20, width: 300, height: 200)
        let affineFromRect1ToRect2 = rect2.affineTransform(from: rect1)
        XCTAssertEqual(affineFromRect1ToRect2.a, 1)
        XCTAssertEqual(affineFromRect1ToRect2.b, 0)
        XCTAssertEqual(affineFromRect1ToRect2.c, 0)
        XCTAssertEqual(affineFromRect1ToRect2.d, 1)
        XCTAssertEqual(affineFromRect1ToRect2.tx, -15)
        XCTAssertEqual(affineFromRect1ToRect2.ty, 0)
        XCTAssertEqual(CGPoint(x: 50, y: 60).applying(affineFromRect1ToRect2), CGPoint(x: 35, y: 60))
    }
    
    
    func test_map_scale() throws {
        let rect1 = CGRect(x: 10, y: 20, width: 300, height: 200)
        let rect2 = CGRect(x: 20, y: 40, width: 600, height: 400)
        let affineFromRect1ToRect2 = rect2.affineTransform(from: rect1)
        XCTAssertEqual(affineFromRect1ToRect2.a, 2)
        XCTAssertEqual(affineFromRect1ToRect2.b, 0)
        XCTAssertEqual(affineFromRect1ToRect2.c, 0)
        XCTAssertEqual(affineFromRect1ToRect2.d, 2)
        XCTAssertEqual(affineFromRect1ToRect2.tx, -20)
        XCTAssertEqual(affineFromRect1ToRect2.ty, -40)
        XCTAssertEqual(CGPoint(x: 50, y: 60).applying(affineFromRect1ToRect2), CGPoint(x: 80, y: 80))
    }
}
