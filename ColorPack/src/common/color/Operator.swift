//
//  Operator.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorProtocol {
//    public var toAnalogous: (ColorProtocol, ColorProtocol) {
//        func changeValueInSpecifiedWidth(value: Int, width: Int, ratio: Double) -> Int {
//            return Int(Double(value) + Double(width) * ratio)
//        }
//        func calc(target: Int, nearColor: Int, otherColor: Int) -> [(target: Int, nearColor: Int)] {
//            let toDecline = nearColor > otherColor
//            let width = abs(nearColor - otherColor)
//            let length = Double(abs(target - nearColor))
//            let targetMoveRatio = width == 0 ? 0.5 : 0.5 - length / Double(width)
//            return [
//                (
//                    target: nearColor,
//                    nearColor: changeValueInSpecifiedWidth(value: nearColor, width: width, ratio: targetMoveRatio * (toDecline ? -1 : 1))
//                ), (
//                    target: changeValueInSpecifiedWidth(value: target, width: width, ratio: 0.5 * (toDecline ? -1 : 1)),
//                    nearColor: nearColor
//                )
//            ]
//        }
//        func findNearColorAndCalc(max: Int, min: Int, target: Int) -> [(max: Int, min: Int, target: Int)]  {
//            if max - target < target - min {
//                return calc(target: target, nearColor: max, otherColor: min)
//                    .map{(targetValue, maxValue) in (maxValue, min, targetValue)}
//            } else {
//                return calc(target: target, nearColor: min, otherColor: max)
//                    .map{(targetValue, minValue) in (max, minValue, targetValue)}
//            }
//        }
//        func getAnalogous(red: Int, green: Int, blue: Int) -> [(red: Int, green: Int, blue: Int)] {
//            switch (max(red, green, blue), min(red, green, blue)) {
//            case (0, 0):
//                return [(0, 0, 0), (0, 0, 0)]
//            case (red, green):
//                return findNearColorAndCalc(max: red, min: green, target: blue).map{(r, g, b) in (r, g, b)}
//            case (red, blue):
//                return findNearColorAndCalc(max: red, min: blue, target: green).map{(r, b, g) in (r, g, b)}
//            case (green, blue):
//                return findNearColorAndCalc(max: green, min: blue, target: red).map{(g, b, r) in (r, g, b)}
//            case (green, red):
//                return findNearColorAndCalc(max: green, min: red, target: blue).map{(g, r, b) in (r, g, b)}
//            case (blue, red):
//                return findNearColorAndCalc(max: blue, min: red, target: green).map{(b, r, g) in (r, g, b)}
//            case (blue, green):
//                return findNearColorAndCalc(max: blue, min: green, target: red).map{(b, g, r) in (r, g, b)}
//            default:
//                return []
//            }
//        }
//        let (r, g, b) = intRGB
//        let result = getAnalogous(red: r, green: g, blue: b).map{(r, g, b) in Self.create(red: r, green: g, blue: b, alpha: alpha)!}
//        return (result[0], result[1])
//    }
}

public func +<C: ColorProtocol>(lhs: C, rhs: C) -> C {
    return lhs.add(rhs)
}
public func -<C: ColorProtocol>(lhs: C, rhs: C) -> C {
    return lhs.subtract(rhs)
}
public func *<C: ColorProtocol>(lhs: C, rhs: C) -> C {
    return lhs.multiply(rhs)
}
public func *<C: ColorProtocol>(lhs: C, rhs: Int) -> C {
    return lhs * Double(rhs)
}
public func *<C: ColorProtocol>(lhs: C, rhs: Double) -> C {
    let value = (lhs.alpha * rhs).asPercentage
    return lhs.withAlpha(value)!
}
public func /<C: ColorProtocol>(lhs: C, rhs: C) -> C {
    return lhs.divide(rhs)
}
public func /<C: ColorProtocol>(lhs: C, rhs: Int) -> C {
    return lhs / Double(rhs)
}
public func /<C: ColorProtocol>(lhs: C, rhs: Double) -> C {
    let value = (lhs.alpha / rhs).asPercentage
    return lhs.withAlpha(value)!
}
public prefix func !<C: ColorProtocol>(lhs: C) -> C {
    return lhs.toComplement
}
public prefix func ~<C: ColorProtocol>(lhs: C) -> C {
    return lhs.toInverse
}
