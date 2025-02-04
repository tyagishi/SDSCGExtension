//
//  CGExtension.swift
//  ExpandableFrameExample
//
//  Created by Tomoaki Yagishita on 2025/01/28.
//

import Foundation



public enum RectangleEdge: Sendable {
    case upper, lower, left, right // i.e. upper = upper middle, lower = lower middle, ...
    case upperLeft, upperRight, lowerLeft, lowerRight
    
    func isOne(of edges: any Collection<RectangleEdge>) -> Bool {
        edges.contains(self)
    }
    
    var onUpperEdge: Bool { self.isOne(of: [.upper, .upperLeft, .upperRight]) }
    var onLowerEdge: Bool { self.isOne(of: [.lower, .lowerLeft, .lowerRight]) }
    var onLeftEdge: Bool { self.isOne(of: [.left, .upperLeft, .lowerLeft]) }
    var onRightEdge: Bool { self.isOne(of: [.right, .upperRight, .lowerRight]) }
    
    public static var all8: [RectangleEdge] { [.upperLeft, .upper, .upperRight, .left, .right, .lowerLeft, .lower, .lowerRight] }
    public static var plus4: [RectangleEdge] { [.upper, .lower, .left, .right] }
    public static var cross4: [RectangleEdge] { [.upperLeft, .upperRight, .lowerLeft, .lowerRight] }
}

extension CGRect {
    public func upperLeft(flipped: Bool = true)  -> CGPoint { .init(x: minX, y: flipped ? minY : maxY) }
    public func upperMid(flipped: Bool = true)   -> CGPoint { .init(x: midX, y: flipped ? minY : maxY) }
    public func upperRight(flipped: Bool = true) -> CGPoint { .init(x: maxX, y: flipped ? minY : maxY) }
    public func rightMid(flipped: Bool = true)   -> CGPoint { .init(x: maxX, y: midY) }
    public func leftMid(flipped: Bool = true)    -> CGPoint { .init(x: minX, y: midY) }
    public func lowerLeft(flipped: Bool = true)  -> CGPoint { .init(x: minX, y: flipped ? maxY : minY) }
    public func lowerMid(flipped: Bool = true)   -> CGPoint { .init(x: midX, y: flipped ? maxY : minY) }
    public func lowerRight(flipped: Bool = true) -> CGPoint { .init(x: maxX, y: flipped ? maxY : minY) }
    
    public func changeSizeWithMovingEdge(edge: RectangleEdge,_ moveVector: CGVector, flipped: Bool = true) -> CGRect? {
        var newOrigin = self.origin
        var newSize = self.size
        
        if edge.onUpperEdge,
           abs(moveVector.dy) > 0 {
            guard (self.originY + moveVector.dy) < self.maxY else { return nil }
            newOrigin.y += moveVector.dy
            newSize.height -= moveVector.dy
        }
        
        if edge.onLowerEdge,
           abs(moveVector.dy) > 0 {
            guard self.size.height + moveVector.dy > 0 else { return nil }
            newSize.height += moveVector.dy
        }
        
        if edge.onRightEdge,
           abs(moveVector.dx) > 0 {
            guard self.size.width + moveVector.dx > 0 else { return nil }
            newSize.width += moveVector.dx
        }

        if edge.onLeftEdge,
           abs(moveVector.dx) > 0 {
            guard (self.originX + moveVector.dx) < self.maxX else { return nil }
            newOrigin.x += moveVector.dx
            newSize.width -= moveVector.dx
        }

        return CGRect(origin: newOrigin, size: newSize)
    }
}

extension CGRect {
    var normalized: CGRect {
        let origin = CGPoint(x: self.originX / self.maxX, y: self.originY / self.maxY)
        let size = CGSize(width: self.width / self.maxX, height: self.height / self.maxY)
        return CGRect(origin: origin, size: size)
    }
}
