//
//  CG-Extension.swift
//  ExifClip2020
//
//  Created by Tomoaki Yagishita on 2020/05/26.
//  Copyright © 2020 SmallDeskSoftware. All rights reserved.
//

import Foundation

extension CGSize {
    static public func verticalScale(base:CGSize, target:CGSize) -> CGFloat {
        return target.height / base.height
    }
    static public func horizontalScale(base: CGSize, target: CGSize) -> CGFloat {
        return target.width / base.width
    }
    
    static public func minScale(base: CGSize, target:CGSize) -> CGFloat {
        let verticalScale = CGSize.verticalScale(base: base, target: target)
        let horizontalScale = CGSize.horizontalScale(base: base, target: target)
        return verticalScale < horizontalScale ? verticalScale : horizontalScale
    }
    
    static public func maxScale(base: CGSize, target:CGSize) -> CGFloat {
        let verticalScale = CGSize.verticalScale(base: base, target: target)
        let horizontalScale = CGSize.horizontalScale(base: base, target: target)
        return verticalScale > horizontalScale ? verticalScale : horizontalScale
    }
    
    public func scale(_ value:CGFloat) -> CGSize {
        return CGSize(width: self.width * value, height: self.height * value)
    }
    
    public func expand(_ size: CGSize) -> CGSize {
        return CGSize(width: self.width + size.width, height: self.height + size.height)
    }
    public func expand(_ xDir: CGFloat,_ yDir:CGFloat) -> CGSize {
        return CGSize(width: self.width + xDir, height: self.height + yDir)
    }
    public func move(_ size: CGSize) -> CGSize {
        return CGSize(width: self.width + size.width, height: self.height + size.height)
    }
    public func move(_ xDir: CGFloat,_ yDir:CGFloat) -> CGSize {
        return CGSize(width: self.width + xDir, height: self.height + yDir)
    }

    public var isLandscape:Bool {
        return self.width >= self.height
    }
    
    public func rotate() -> CGSize {
        return CGSize(width: self.height, height: self.width)
    }
    
}

extension CGSize {
    public func cgPoint() -> CGPoint {
        return CGPoint(x: self.width, y: self.height)
    }
}

extension CGPoint {
    public func shift(_ diffX: CGFloat, _ diffY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + diffX, y: self.y + diffY)
    }
    public func shift(_ size: CGSize) -> CGPoint {
        return CGPoint(x: self.x + size.width, y: self.y + size.height)
    }
}
