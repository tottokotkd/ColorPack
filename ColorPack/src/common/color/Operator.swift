//
//  Operator.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

// 'calculation' protocol operator
public func +<C: ColorCalculationProtocol>(lhs: C, rhs: C) -> C {
    return lhs.add(rhs)
}
public func -<C: ColorCalculationProtocol>(lhs: C, rhs: C) -> C {
    return lhs.subtract(rhs)
}
public func *<C: ColorCalculationProtocol>(lhs: C, rhs: C) -> C {
    return lhs.multiply(rhs)
}
public func /<C: ColorCalculationProtocol>(lhs: C, rhs: C) -> C {
    return lhs.divide(rhs)
}
public prefix func !<C: ColorSchemeProtocol>(lhs: C) -> C {
    return lhs.toComplementary
}
public prefix func ~<C: ColorSchemeProtocol>(lhs: C) -> C {
    return lhs.toInverse
}

// 'manipulation' protocol operator
public func *<C: ColorManipulationProtocol>(lhs: C, rhs: Double) -> C {
    let value = (lhs.alpha * rhs).asPercentage
    return lhs.withAlpha(value)!
}
public func /<C: ColorManipulationProtocol>(lhs: C, rhs: Double) -> C {
    let value = (lhs.alpha / rhs).asPercentage
    return lhs.withAlpha(value)!
}
