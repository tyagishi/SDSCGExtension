//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2021/03/10
//  © 2021  SmallDeskSoftware
//

import Foundation

extension CGRect {
    func adjustWidthKeepingSizeRatio(_ newWidth: CGFloat) -> CGRect {
        let newHeight = self.height * newWidth / self.width
        return CGRect(origin: self.origin, size: CGSize(width: newWidth, height: newHeight))
    }
    
    func adjustHeightKeepingSizeRatio(_ newHeight: CGFloat) -> CGRect {
        let newWidth = self.width * newHeight / self.height
        return CGRect(origin: self.origin, size: CGSize(width: newWidth, height: newHeight))
    }
}
