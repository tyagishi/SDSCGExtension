//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/01/26
//  © 2021  SmallDeskSoftware
//

import Foundation
import CoreGraphics

extension CGVector {
    public init(from: CGPoint, to: CGPoint) {
        self.init(dx: to.x - from.x, dy: to.y - from.y)
    }
}

// MARK: CGVector / flip
extension CGVector {
    public func flipY() -> CGVector {
        return CGVector(dx: self.dx, dy: self.dy * -1)
    }
}

// MARK: CGVector / scale
extension CGVector {
    public static var scaleOne = CGVector(dx: 1, dy: 1)

    public func scale(_ value:CGFloat) -> CGVector {
        return CGVector(dx: self.dx * value, dy: self.dy * value)
    }
    public func scale(_ xValue: CGFloat, _ yValue: CGFloat) -> CGVector {
        return CGVector(dx: self.dx * xValue, dy: self.dy * yValue)
    }
}

// MARK: conversion between CGPoint/CGSize/CGVector
extension CGVector {
    public func cgPoint() -> CGPoint {
        return CGPoint(x: self.dx, y: self.dy)
    }
    public func cgSize() -> CGSize {
        return CGSize(width: self.dx, height: self.dy)
    }
}
