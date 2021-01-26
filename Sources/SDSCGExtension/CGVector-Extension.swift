//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/01/26
//  © 2021  SmallDeskSoftware
//

import Foundation
import CoreGraphics

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
extension CGVector {
    public func cgPoint() -> CGPoint {
        return CGPoint(x: self.dx, y: self.dy)
    }
    public func cgSize() -> CGSize {
        return CGSize(width: self.dx, height: self.dy)
    }
}
