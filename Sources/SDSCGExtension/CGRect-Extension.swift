//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/01/26
//  © 2021  SmallDeskSoftware
//

import Foundation
import CoreGraphics

extension CGRect {
    public func rectCenter() -> CGPoint {
        return CGPoint(x: self.origin.x + self.size.width / 2.0, y: self.origin.y + self.size.height / 2.0)
    }
    public func cornerXmaxYmax() -> CGPoint {
        return CGPoint(x: self.origin.x + self.size.width, y: self.origin.y + self.size.height)
    }
    public func ratioPoint(_ ratioVector: CGVector) -> CGPoint {
        return CGPoint(x: self.origin.x + self.size.width * ratioVector.dx, y: self.origin.y + self.size.height * ratioVector.dy)
    }
    public func scale(_ value:CGFloat) -> CGRect {
        return CGRect(origin: self.origin.scale(value), size: self.size.scale(value))
    }
}
