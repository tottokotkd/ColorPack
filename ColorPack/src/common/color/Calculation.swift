//
//  Operator.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorProtocol {
    public func add(_ rhs: ColorProtocol) -> ColorProtocol {
        return merge(rhs, transformColor: {(m, i) in min(255, m + i)})!
    }
    public func subtract(_ rhs: ColorProtocol) -> ColorProtocol {
        return merge(rhs, transformColor: {(m, i) in max(0, m - i)})!
    }
    public func multiply(_ rhs: ColorProtocol) -> ColorProtocol {
        return merge(rhs, transformColor: {(m, i) in (m * i) / 255})!
    }
    public func divide(_ rhs: ColorProtocol) -> ColorProtocol {
        return merge(rhs, transformColor: {(m, i) in min(255, (256 * m) / (i + 1))})!
    }
    public var toInverse: ColorProtocol {
        return map(transformColor: {255 - $0})!
    }
    public var toComplement: ColorProtocol {
        let (r, g, b) = intRGB
        let key = max(r, g, b) + min(r, g, b)
        return map(transformColor: {key - $0})!
    }
}

public func +(lhs: ColorProtocol, rhs: ColorProtocol) -> ColorProtocol {
    return lhs.add(rhs)
}
public func -(lhs: ColorProtocol, rhs: ColorProtocol) -> ColorProtocol {
    return lhs.subtract(rhs)
}
public func *(lhs: ColorProtocol, rhs: ColorProtocol) -> ColorProtocol {
    return lhs.multiply(rhs)
}
public func /(lhs: ColorProtocol, rhs: ColorProtocol) -> ColorProtocol {
    return lhs.divide(rhs)
}
public func /(lhs: ColorProtocol, rhs: Double) -> ColorProtocol? {
    return lhs.withAlpha(lhs.alpha / rhs)
}
public func /(lhs: ColorProtocol, rhs: Int) -> ColorProtocol? {
    return lhs / Double(rhs)
}
public prefix func !(lhs: ColorProtocol) -> ColorProtocol {
    return lhs.toComplement
}
public prefix func ~(lhs: ColorProtocol) -> ColorProtocol {
    return lhs.toInverse
}
