//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/03/10
//  © 2021  SmallDeskSoftware
//

import Foundation

extension CGRect {
    public func moveBottomRightCornerToNewWidthKeepingSizeRatio(_ newWidth: CGFloat) -> CGRect {
        let newHeight = self.height * newWidth / self.width
        return CGRect(origin: self.origin, size: CGSize(width: newWidth, height: newHeight))
    }
    
    public func moveBottomRightCornerToNewHeightKeepingSizeRatio(_ newHeight: CGFloat) -> CGRect {
        let newWidth = self.width * newHeight / self.height
        return CGRect(origin: self.origin, size: CGSize(width: newWidth, height: newHeight))
    }
    
    public func moveBottomLeftCornerToNewWidthKeepingSizeRatio(_ newWidth: CGFloat ) -> CGRect {
        let newHeight = self.height * newWidth / self.width
        let newOrigin = CGPoint(x: self.origin.x + (self.width - newWidth), y: self.origin.y)
        return CGRect(origin: newOrigin, size: CGSize(width: newWidth, height: newHeight))
    }
    
    public func moveBottomLeftCornerToNewHeightKeepingSizeRatio(_ newHeight: CGFloat ) -> CGRect {
        let newWidth = self.width * newHeight / self.height
        let newOrigin = CGPoint(x: self.origin.x + (self.width - newWidth), y: self.origin.y)
        return CGRect(origin: newOrigin, size: CGSize(width: newWidth, height: newHeight))
    }
}
