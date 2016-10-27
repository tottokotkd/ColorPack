//
//  Util.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import Foundation

public protocol DoubleRGBColorInitializer {
    static func create(red: Double, green: Double, blue: Double, alpha: Double) -> DoubleRGBColor?
    static func truncate(red: Double, green: Double, blue: Double, alpha: Double) -> DoubleRGBColor
}

extension DoubleRGBColorInitializer {
    public static func create(red: Double, green: Double, blue: Double, alpha: Double = 1.0) -> DoubleRGBColor? {
        return DoubleRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    public static func truncate(red: Double, green: Double, blue: Double, alpha: Double = 1.0) -> DoubleRGBColor {
        return DoubleRGBColor(red: truncateColorValue(red),
                              green: truncateColorValue(green),
                              blue: truncateColorValue(blue),
                              alpha: truncateAlphaValue(alpha))!
    }
    public static func truncateColorValue(_ value: Double) -> Double {
        return max(min(value, 1), 0)
    }
}

public struct DoubleRGBColor: DoubleRGBColorProtocol {
    public typealias T = (red: Double, green: Double, blue: Double)
    public let rawValue: T
    public let alpha: Double
    public init?(rawValue: T, alpha: Double) {
        self.init(red: rawValue.red, green: rawValue.green, blue: rawValue.blue, alpha: alpha)
    }
    public init?(red: Double, green: Double, blue: Double, alpha: Double) {
        if 0...1 ~= red && 0...1 ~= green && 0...1 ~= blue && 0...1 ~= alpha  {
            self.rawValue = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public var toDoubleRGB: (red: Double, green: Double, blue: Double) {return rawValue}
    
    public func map(transformColor: (Double) throws -> Double) rethrows -> DoubleRGBColor? {
        let (r, g, b) = rawValue
        let red = try transformColor(r)
        let green = try transformColor(g)
        let blue = try transformColor(b)
        return DoubleRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    public func merge(_ rhs: DoubleRGBColor, transformColor: (Double, Double) throws -> Double) rethrows -> DoubleRGBColor? {
        let (r1, g1, b1) = rawValue
        let (r2, g2, b2) = rhs.rawValue
        let red = try transformColor(r1, r2)
        let green = try transformColor(g1, g2)
        let blue = try transformColor(b1, b2)
        return DoubleRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func add(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in min(1, m + i)})!
    }
    public func subtract(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in max(0, m - i)})!
    }
    public func multiply(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in m * i})!
    }
    public func divide(_ rhs: DoubleRGBColor) -> DoubleRGBColor {
        return merge(rhs, transformColor: {(m, i) in i == 0 ? 1 : min(1, m / i)})!
    }
    
    public var toInverse: DoubleRGBColor {
        return map(transformColor: {1 - $0})!
    }
    public var toComplement: DoubleRGBColor {
        let (r, g, b) = rawValue
        let key = max(r, g, b) + min(r, g, b)
        return map(transformColor: {key - $0})!
    }
    
    public var description: String {
        let (r, g, b) = rawValue
        return "DoubleRGBColor <red: \(r), green: \(g), blue: \(b), alpha: \(alpha)>"
    }
}
