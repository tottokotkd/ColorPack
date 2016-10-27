//
//  Util.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import Foundation

public protocol DoubleRGBColorInitializer {
    static func create(red: Percentage, green: Percentage, blue: Percentage, alpha: Percentage) -> DoubleRGBColor?
    static func truncate(red: Percentage, green: Percentage, blue: Percentage, alpha: Percentage) -> DoubleRGBColor
}

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

public struct DoubleRGBColor: DoubleRGBColorProtocol {
    public typealias T = (red: Percentage, green: Percentage, blue: Percentage)
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
    public var toDoubleRGB: (red: Percentage, green: Percentage, blue: Percentage) {return rawValue}
    
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
    
    public func add(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m + i).asPercentage})!
    }
    public func subtract(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m - i).asPercentage})!
    }
    public func multiply(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m * i / percentageMax).asPercentage})!
    }
    public func divide(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in i == 0 ? percentageMax : (m / i).asPercentage})!
    }
    
    public var toInverse: DoubleRGBColor {
        return map(transformColor: {percentageMax - $0})!
    }
    public var toComplement: DoubleRGBColor {
        let (r, g, b) = rawValue
        let key = max(r, g, b) + min(r, g, b)
        return map(transformColor: {(key - $0).asPercentage})!
    }
    
    public var description: String {
        let (r, g, b) = rawValue
        return "DoubleRGBColor <red: \(r)%, green: \(g)%, blue: \(b)%, alpha: \(alpha)%>"
    }
}
