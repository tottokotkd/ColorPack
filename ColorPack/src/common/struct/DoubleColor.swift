//
//  Util.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import Foundation

extension DoubleRGBColorInitializer {
    public static func create(red: Percentage, green: Percentage, blue: Percentage, alpha: Percentage = percentageMax) -> DoubleRGBColor? {
        return DoubleRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    public static func truncate(red: Percentage, green: Percentage, blue: Percentage, alpha: Percentage = percentageMax) -> DoubleRGBColor {
        return DoubleRGBColor(red: truncateColorValue(red),
                              green: truncateColorValue(green),
                              blue: truncateColorValue(blue),
                              alpha: alpha.asPercentage)!
    }
    public static func truncateColorValue(_ value: Double) -> Double {
        return max(min(value, 1), 0)
    }
}

public struct DoubleRGBColor: DoubleRGBColorProtocol, ColorStructConvertor {
    public typealias T = DoubleRGBData
    public let rawValue: T
    public let alpha: Percentage
    
    public init?(rawValue: T, alpha: Percentage) {
        self.init(red: rawValue.red, green: rawValue.green, blue: rawValue.blue, alpha: alpha)
    }
    public init?(red: Percentage, green: Percentage, blue: Percentage, alpha: Percentage) {
        if red.inPercentageRange && green.inPercentageRange && blue.inPercentageRange && alpha.inPercentageRange  {
            self.rawValue = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public var toDoubleRGBData: T {return rawValue}
}

extension DoubleRGBColor: ColorCalculationProtocol {
    public func add(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m + i).asPercentage})!
    }
    public func subtract(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m - i).asPercentage})!
    }
    public func multiply(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m * i).asPercentage})!
    }
    public func divide(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in i == 0 ? percentageMax : (m / i).asPercentage})!
    }
}

extension DoubleRGBColor: ColorManipulationProtocol {
    public func map(transformColor: (Percentage) throws -> Percentage) rethrows -> DoubleRGBColor? {
        return try map{(r, g, b) in
            let red = try transformColor(r)
            let green = try transformColor(g)
            let blue = try transformColor(b)
            return (red, green, blue)
        }
    }
    public func merge(_ rhs: DoubleRGBColor, transformColor: (Percentage, Percentage) throws -> Percentage) rethrows -> DoubleRGBColor? {
        return try merge(rhs) {(l: T, r: T) in
            let (r1, g1, b1) = l
            let (r2, g2, b2) = r
            let red = try transformColor(r1, r2)
            let green = try transformColor(g1, g2)
            let blue = try transformColor(b1, b2)
            return (red, green, blue)
        }
    }
    public func merge(_ rhs: DoubleRGBColor, ratio: Percentage) -> DoubleRGBColor {
        let ratioValue = ratio.asPercentage
        if ratioValue == percentageMin {
            return self
        } else if ratioValue == percentageMax {
            return rhs.map(transformAlpha: {_ in alpha})!
        }
        let rightRatio = ratioValue / percentageMax
        let leftRatio = 1 - rightRatio
        return merge(rhs, transformColor: {$0 == $1 ? $0 : ($0 * leftRatio + $1 * rightRatio).asPercentage})!
    }
}

extension DoubleRGBColor: Equatable {
    public static func ==(lhs: DoubleRGBColor, rhs: DoubleRGBColor) -> Bool {
        let (r1, g1, b1) = lhs.rawValue
        let (r2, g2, b2) = rhs.rawValue
        return r1 == r2 && g1 == g2 && b1 == b2 && lhs.alpha == rhs.alpha
    }
}

extension DoubleRGBColor: CustomStringConvertible {
    public var description: String {
        let (r, g, b) = rawValue
        return "DoubleRGBColor <red: \(r)%, green: \(g)%, blue: \(b)%, alpha: \(alpha)%>"
    }
}
