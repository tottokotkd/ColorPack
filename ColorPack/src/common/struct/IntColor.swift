//
//  IntRGBColor.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

public protocol IntRGBColorInitializer {
    static func create(red: RGB, green: RGB, blue: RGB, alpha: Percentage) -> IntRGBColor?
    static func create(hex: Int, alpha: Percentage) -> IntRGBColor?
    static func truncate(red: RGB, green: RGB, blue: RGB, alpha: Percentage) -> IntRGBColor
    static func truncate(hex: Int, alpha: Percentage) -> IntRGBColor
}

extension IntRGBColorInitializer {
    public static func create(red: RGB, green: RGB, blue: RGB, alpha: Percentage = percentageMax) -> IntRGBColor? {
        return IntRGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    public static func create(hex: Int, alpha: Double = percentageMax) -> IntRGBColor? {
        return IntRGBColor(hex: hex, alpha: alpha)
    }
    public static func truncate(red: RGB, green: RGB, blue: RGB, alpha: Percentage = percentageMax) -> IntRGBColor {
        return IntRGBColor(red: red.asRGB, green: green.asRGB, blue: blue.asRGB, alpha: alpha.asPercentage)!
    }
    public static func truncate(hex: Int, alpha: Percentage = percentageMax) -> IntRGBColor {
        return IntRGBColor(hex: hex.asHex, alpha: alpha.asPercentage)!
    }
}

public struct IntRGBColor: IntRGBColorProtocol {

    public typealias T = (red: RGB, green: RGB, blue: RGB)
    public let rawValue: T
    public let alpha: Percentage
    
    public init?(rawValue: T, alpha: Percentage) {
        self.init(red: rawValue.red, green: rawValue.green, blue: rawValue.blue, alpha: alpha)
    }
    public init?(red: Int, green: Int, blue: Int, alpha: Percentage) {
        if red.inRGBRange && green.inRGBRange && blue.inRGBRange && alpha.inPercentageRange {
            self.rawValue = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public init?(hex: Int, alpha: Percentage) {
        if hex.inHexRange && alpha.inPercentageRange {
            let red = RGB((hex & 0xFF0000) >> 16)
            let green = RGB((hex & 0x00FF00) >> 8)
            let blue = RGB(hex & 0x0000FF)
            self.rawValue = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public var toIntRGB: (red: Int, green: Int, blue: Int) {
        let (r, g, b) = rawValue
        return (Int(r), Int(g), Int(b))
    }
    
    public func map(transformColor: (RGB) throws -> RGB) rethrows -> IntRGBColor? {
        return try map{(r, g, b) in
            let red = try transformColor(r)
            let green = try transformColor(g)
            let blue = try transformColor(b)
            return (red, green, blue)
        }
    }
    public func merge(_ rhs: IntRGBColor, transformColor: (RGB, RGB) throws -> RGB) rethrows -> IntRGBColor? {
        return try merge(rhs) {(l: T, r: T) in
            let (r1, g1, b1) = l
            let (r2, g2, b2) = r
            let red = try transformColor(r1, r2)
            let green = try transformColor(g1, g2)
            let blue = try transformColor(b1, b2)
            return (red, green, blue)
        }
    }
    
    public func add(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m + i).asRGB})!
    }
    public func subtract(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in (m - i).asRGB})!
    }
    public func multiply(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in ((m * i) / rgbMax).asRGB})!
    }
    public func divide(_ rhs: IntRGBColor) -> IntRGBColor {
        return merge(rhs, transformColor: {(m, i) in i == 0 ? rgbMax : (m / i).asRGB})!
    }
    
    public var toInverse: IntRGBColor {
        return map(transformColor: {rgbMax - $0})!
    }
    public var toComplement: IntRGBColor {
        let (r, g, b) = rawValue
        let key = max(r, g, b) + min(r, g, b)
        return map(transformColor: {key - $0})!
    }

    public var description: String {
        let (r, g, b) = rawValue
        return "IntRGBColor #\(toHexString) <red: \(r), green: \(g), blue: \(b), alpha: \(alpha)%>"
    }
}
