//
//  CG-Extension.swift
//  ExifClip2020
//
//  Created by Tomoaki Yagishita on 2020/05/26.
//  Copyright © 2020 SmallDeskSoftware. All rights reserved.
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

// MARK: CGSize / calc
extension CGSize {
    public func center() -> CGPoint {
        return CGPoint(x: self.width / 2, y: self.height / 2)
    }
    public func areaSquared() -> CGFloat {
        return self.width * self.height
    }
}

// MARK: CGPoint / operation
extension CGPoint {
    public func move(_ vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    public func move(_ diffX: CGFloat, _ diffY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + diffX, y: self.y + diffY)
    }

    public func shift(_ diffX: CGFloat, _ diffY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + diffX, y: self.y + diffY)
    }
    public func shift(_ size: CGSize) -> CGPoint {
        return CGPoint(x: self.x + size.width, y: self.y + size.height)
    }
    
    public func diffVectorFrom(_ from:CGPoint) -> CGVector {
        return CGVector(dx: self.x - from.x, dy: self.y - from.y)
    }
    
    public func scale(_ value:CGFloat) -> CGPoint {
        return CGPoint(x: self.x * value, y: self.y * value)
    }
    
}

// MARK: CGVector / operation
extension CGVector {
    public func scale(_ value:CGFloat) -> CGVector {
        return CGVector(dx: self.dx * value, dy: self.dy * value)
    }
    public func scale(_ xValue: CGFloat, _ yValue: CGFloat) -> CGVector {
        return CGVector(dx: self.dx * xValue, dy: self.dy * yValue)
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

extension CGPoint {
    public func cgSize() -> CGSize {
        return CGSize(width: self.x, height: self.y)
    }
    public func cgVector() -> CGVector {
        return CGVector(dx: self.x, dy: self.y)
    }
}

extension CGVector {
    public func cgPoint() -> CGPoint {
        return CGPoint(x: self.dx, y: self.dy)
    }
    public func cgSize() -> CGSize {
        return CGSize(width: self.dx, height: self.dy)
    }
}


