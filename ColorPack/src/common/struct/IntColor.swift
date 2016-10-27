//
//  IntRGBColor.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

public protocol IntRGBColorInitializer {
    static func create(red: Int, green: Int, blue: Int, alpha: Double) -> IntRGBColor?
    static func create(hex: Int, alpha: Double) -> IntRGBColor?
    static func truncate(red: Int, green: Int, blue: Int, alpha: Double) -> IntRGBColor
    static func truncate(hex: Int, alpha: Double) -> IntRGBColor
}

extension IntRGBColorInitializer {
    public static func create(red: Int, green: Int, blue: Int, alpha: Double = 1.0) -> IntRGBColor? {
        return IntRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    public static func create(hex: Int, alpha: Double = 1.0) -> IntRGBColor? {
        return IntRGBColor(hex: hex, alpha: alpha)
    }
    public static func truncate(red: Int, green: Int, blue: Int, alpha: Double = 1.0) -> IntRGBColor {
        return IntRGBColor(red: truncateColorValue(red),
                           green: truncateColorValue(green),
                           blue: truncateColorValue(blue),
                           alpha: truncateAlphaValue(alpha))!
    }
    public static func truncate(hex: Int, alpha: Double = 1.0) -> IntRGBColor {
        return IntRGBColor(hex: max(min(hex, 0xFFFFFF), 0),
                           alpha: truncateAlphaValue(alpha))!
    }
    public static func truncateColorValue(_ value: Int) -> Int {
        return max(min(value, 255), 0)
    }
}

public struct IntRGBColor: IntRGBColorProtocol {

    public typealias T = (red: Int, green: Int, blue: Int)
    public let rawValue: T
    public let alpha: Double
    
    public init?(rawValue: T, alpha: Double) {
        self.init(red: rawValue.red, green: rawValue.green, blue: rawValue.blue, alpha: alpha)
    }
    public init?(red: Int, green: Int, blue: Int, alpha: Double) {
        if 0...255 ~= red && 0...255 ~= green && 0...255 ~= blue && 0...1 ~= alpha  {
            self.rawValue = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public init?(hex: Int, alpha: Double = 1.0) {
        if 0...0xFFFFFF ~= hex && 0...1 ~= alpha {
            let red = (hex & 0xFF0000) >> 16
            let green = (hex & 0x00FF00) >> 8
            let blue = hex & 0x0000FF
            self.rawValue = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public var toIntRGB: (red: Int, green: Int, blue: Int) {return rawValue}
    
    public func map(transformColor: (Int) throws -> Int) rethrows -> IntRGBColor? {
        let (r, g, b) = rawValue
        let red = try transformColor(r)
        let green = try transformColor(g)
        let blue = try transformColor(b)
        return IntRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    public func merge(_ rhs: IntRGBColor, transformColor: (Int, Int) throws -> Int) rethrows -> IntRGBColor? {
        let (r1, g1, b1) = rawValue
        let (r2, g2, b2) = rhs.rawValue
        let red = try transformColor(r1, r2)
        let green = try transformColor(g1, g2)
        let blue = try transformColor(b1, b2)
        return IntRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func add(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in min(255, m + i)})!
    }
    public func subtract(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in max(0, m - i)})!
    }
    public func multiply(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m * i) / 255})!
    }
    public func divide(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in i == 0 ? 255 : min(255, m / i)})!
    }
    
    public var toInverse: IntRGBColor {
        return map(transformColor: {255 - $0})!
    }
    public var toComplement: IntRGBColor {
        let (r, g, b) = rawValue
        let key = max(r, g, b) + min(r, g, b)
        return map(transformColor: {key - $0})!
    }

    public var description: String {
        let (r, g, b) = rawValue
        return "IntRGBColor #\(toHexString) <red: \(r), green: \(g), blue: \(b), alpha: \(alpha)>"
    }
}
