//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/01/26
//  © 2021  SmallDeskSoftware
//

import Foundation
import CoreGraphics

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
    public func convertFromLowerLeftOriginToUpperLeftOrigin(_ canvasSize: CGSize) -> CGRect {
        let newOrigin = CGPoint(x: self.origin.x, y: canvasSize.height - self.origin.y - self.size.height)
        return CGRect(origin: newOrigin, size: self.size)
    }
    public func convertFromUpperLeftOriginToLowerLeftOrigin(_ canvasSize: CGSize) -> CGRect {
        let newOrigin = CGPoint(x: self.origin.x, y: canvasSize.height - self.origin.y - self.size.height)
        return CGRect(origin: newOrigin, size: self.size)
    }
}


