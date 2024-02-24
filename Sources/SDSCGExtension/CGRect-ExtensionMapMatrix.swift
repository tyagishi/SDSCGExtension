//
//  CGRect-ExtensionMapMatrix.swift
//
//  Created by : Tomoaki Yagishita on 2022/02/18
//  © 2022  SmallDeskSoftware
//

import Foundation
import CoreGraphics

extension CGRect {
    func affineTransform(from: CGRect) -> CGAffineTransform {
        let tx = from.originX - self.originX
        let ty = from.originY - self.originY
        let scaleX = self.width / from.width
        let scaleY = self.height / from.height
        return CGAffineTransform.identity.scaledBy(x: scaleX, y: scaleY).translatedBy(x: tx, y: ty)
    }
}
