//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/01/26
//  © 2021  SmallDeskSoftware
//

import Foundation
import CoreGraphics

// MARK: CGSize / operation
extension CGSize {
    static public func verticalScale(base:CGSize, target:CGSize) -> CGFloat {
        return target.height / base.height
    }
    static public func horizontalScale(base: CGSize, target: CGSize) -> CGFloat {
        return target.width / base.width
    }
    
    static public func scales(base: CGSize, target: CGSize) -> (vertical:CGFloat, horizontal: CGFloat, min: CGFloat, max: CGFloat) {
        let verticalScale = CGSize.verticalScale(base: base, target: target)
        let horizontalScale = CGSize.horizontalScale(base: base, target: target)
        return (verticalScale, horizontalScale, min(verticalScale,horizontalScale), max(verticalScale, horizontalScale))
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
    public func scale(_ xValue:CGFloat, _ yValue:CGFloat) -> CGSize {
        return CGSize(width: self.width * xValue, height: self.height * yValue)
    }
    public func scale(_ vector: CGVector) -> CGSize {
        return CGSize(width: self.width * vector.dx, height: self.height * vector.dy)
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

// MARK: coordinate calc
extension CGSize {
    public func center() -> CGPoint {
        return CGPoint(x: self.width / 2, y: self.height / 2)
    }
    public func areaSquared() -> CGFloat {
        return self.width * self.height
    }
}

// MARK: convenient calc for SwiftUI scaledToFit placement (calc CGRect for scaledToFit view in specified size)
extension CGSize {
    public func placeInSizedCanvas(_ canvas:CGSize) -> CGRect {
        let scaleAlongX = canvas.width / self.width
        let scaleAlongY = canvas.height / self.height
        let usedScale = min(scaleAlongX, scaleAlongY)
        let originX = (canvas.width - self.width * usedScale) / 2.0
        let originY = (canvas.height - self.height * usedScale) / 2.0
        return CGRect(origin: CGPoint(x: originX, y: originY), size: self.scale(usedScale))
    }
}


// MARK: conversion between CGPoint/CGSize/CGVector
extension CGSize {
    public func cgPoint() -> CGPoint {
        return CGPoint(x: self.width, y: self.height)
    }
    public func cgVector() -> CGVector {
        return CGVector(dx: self.width, dy: self.height)
    }
}
