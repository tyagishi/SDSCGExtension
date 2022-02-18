//
//  SDSCanvas.swift
//
//  Created by : Tomoaki Yagishita on 2022/02/18
//  © 2022  SmallDeskSoftware
//

import Foundation
import CoreGraphics
//
//
//
//  ^    ^
//  |    |
//  |    |
//       |
//  h    |
//  e    |
//  i    |
//  g    |
//  h    |
//  t    |
//       |
//  |    | originPosition
//  | ---+-------------------->
//  |    |
//  v    |
//    <---- canvasSize.width ->
//
// example
// in case originPosition = (100,100)
// (0,0) point will be located at (100,100)
// in case xScale,yScale = 2.0 and originPosition = (100,100)
// (50,50) point will be located at (100+50*2, 100+50*2), because 1.0 along xAxis means 2.0 in canvas
//
// note: always coordinate system start from lowerleft
//
//
public struct SDSCanvas {
    public var originPos: CGPoint
    public var originValue: CGPoint
    public var canvasSize: CGSize
    public init(originPos: CGPoint, originValue: CGPoint, canvasSize: CGSize) {
        self.originPos = originPos
        self.originValue = originValue
        self.canvasSize = canvasSize
    }
    
    public var originPosX: CGFloat {
        originPos.x
    }
    public var originPosY: CGFloat {
        originPos.y
    }
    public var originValueX: CGFloat {
        originValue.x
    }
    public var originValueY: CGFloat {
        originValue.y
    }
    public var canvasWidth: CGFloat {
        canvasSize.width
    }
    public var canvasHeight: CGFloat {
        canvasSize.height
    }
}

