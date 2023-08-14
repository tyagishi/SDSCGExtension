//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/01/26
//  © 2021  SmallDeskSoftware
//

import Foundation
import CoreGraphics

extension CGRect: CustomStringConvertible {
    public var description: String {
        "origin: \(self.origin), size: \(self.size)"
    }
}

// MARK: CGRect / operation
extension CGRect {
    public func scale(_ value:CGFloat) -> CGRect {
        return CGRect(origin: self.origin.scale(value), size: self.size.scale(value))
    }
    public func scale(_ scaleX: CGFloat, _ scaleY: CGFloat) -> CGRect {
        return CGRect(origin: self.origin.scale(scaleX, scaleY), size: self.size.scale(scaleX, scaleY))
    }
    public func flipY(_ maxY: CGFloat) -> CGRect {
        return CGRect(origin: CGPoint(x: self.origin.x, y: maxY - self.origin.y - self.size.height ), size: self.size)
    }
    public func moveOrigin(_ moveVector: CGVector) -> CGRect {
        return CGRect(origin: self.origin.move(moveVector), size: self.size)
    }
}

// MARK: coordinate calc
extension CGRect {
    public func pointInRect(ratioX: CGFloat, ratioY: CGFloat) -> CGPoint {
        return CGPoint(x: self.origin.x + self.size.width * ratioX, y: self.origin.y + self.size.height * ratioY)
    }
    public func rectCenter() -> CGPoint {
        return CGPoint(x: self.origin.x + self.size.width / 2.0, y: self.origin.y + self.size.height / 2.0)
    }
    public func cornerXmaxYmax() -> CGPoint {
        return CGPoint(x: self.origin.x + self.size.width, y: self.origin.y + self.size.height)
    }
    public func ratioPoint(_ ratioVector: CGVector) -> CGPoint {
        return CGPoint(x: self.origin.x + self.size.width * ratioVector.dx, y: self.origin.y + self.size.height * ratioVector.dy)
    }
}

extension CGRect {
    public var originX:CGFloat {
        get {
            return self.origin.x
        }
        set(newValue) {
            self.origin.x = newValue
        }
    }
    public var originY:CGFloat {
        get {
            return self.origin.y
        }
        set(newValue) {
            self.origin.y = newValue
        }
    }
}

extension CGRect {
    public func convertFromLowerLeftOriginToUpperLeftOrigin(_ canvasSize: CGSize) -> CGRect {
        let newOrigin = CGPoint(x: self.origin.x, y: canvasSize.height - self.origin.y - self.size.height)
        return CGRect(origin: newOrigin, size: self.size)
    }
    public func convertFromUpperLeftOriginToLowerLeftOrigin(_ canvasSize: CGSize) -> CGRect {
        let newOrigin = CGPoint(x: self.origin.x, y: canvasSize.height - self.origin.y - self.size.height)
        return CGRect(origin: newOrigin, size: self.size)
    }
}

extension CGRect {
    // change width with keeping rectangle center at same point
    public func changeWidth(to newWidth:CGFloat) -> CGRect {
        let diffToNewWidth = newWidth - self.width
        return CGRect(x: self.originX - diffToNewWidth / 2.0, y: self.originY,
                      width: newWidth, height: self.height)
    }

    // assumed: upper-left origin
    public func expand(top: CGFloat = 0.0, bottom: CGFloat = 0.0, left: CGFloat = 0.0, right: CGFloat = 0.0) -> CGRect {
        return CGRect(x: self.originX - left, y: self.originY - top, width: self.width + left + right , height: self.height + top + bottom)
    }
}

extension CGRect {
    public func LUpoint() -> CGPoint {
        return CGPoint(x: self.minX, y: self.minY)
    }
    
    public func center() -> CGPoint {
        return CGPoint(x: self.originX + self.width * 0.5, y: self.originY + self.height * 0.5)
    }
}

