//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/01/26
//  © 2021  SmallDeskSoftware
//

import Foundation
import CoreGraphics

// MARK: CGPoint / operation
extension CGPoint {
    public static func +(lhs: CGPoint, rhs: CGVector) -> CGPoint{
        return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }
    public static func -(lhs: CGPoint, rhs: CGVector) -> CGPoint{
        return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
    }

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
    public func scale(_ scaleX:CGFloat, _ scaleY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x * scaleX, y: self.y * scaleY)
    }
    public func scale(_ scale: CGVector) -> CGPoint {
        return CGPoint(x: self.x * scale.dx, y: self.y * scale.dy)
    }
}

// MARK: coordinate calc
extension CGPoint {
    public func flipY(_ maxY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: maxY - self.y)
    }
}

// MARK: conversion between CGPoint/CGSize/CGVector
extension CGPoint {
    public func cgSize() -> CGSize {
        return CGSize(width: self.x, height: self.y)
    }
    public func cgVector() -> CGVector {
        return CGVector(dx: self.x, dy: self.y)
    }
}

// MARK: map between two CGRect coordinate (assume for shrinking focus area from from-CGRect to to-CGRect, then need to calc point's new coordinate in to-CGRect)
extension CGPoint {
    public func map(from: CGRect, to: CGRect) -> CGPoint {
        let originDiff = from.origin.diffVectorFrom(to.origin)
        return CGPoint(x: self.x + originDiff.dx, y: self.y + originDiff.dy)
    }
}
