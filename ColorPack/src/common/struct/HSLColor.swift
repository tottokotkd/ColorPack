//
//  HSLColor.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/27.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension HSLColorInitializer {
    public static func create(hue: Degree?, saturation: Percentage, lightness: Percentage, alpha: Percentage = percentageMax) -> HSLColor? {
        return HSLColor(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)
    }
    public static func truncate(hue: Degree?, saturation: Percentage, lightness: Percentage, alpha: Percentage = percentageMax) -> HSLColor {
        return HSLColor(hue: hue?.asDegree, saturation: saturation.asPercentage, lightness: lightness.asPercentage, alpha: alpha.asPercentage)!
    }
    public static func truncateColorValue(_ value: Double) -> Double {
        return max(min(value, 1), 0)
    }
}

public struct HSLColor: HSLColorProtocol, ColorStructConvertor {
    public typealias T = (hue: Degree?, saturation: Percentage, lightness: Percentage)
    public let rawValue: T
    public let alpha: Percentage
    
    public init?(rawValue: T, alpha: Percentage) {
        self.init(hue: rawValue.hue, saturation: rawValue.saturation, lightness: rawValue.lightness, alpha: alpha)
    }
    public init?(hue: Degree?, saturation: Percentage, lightness: Percentage, alpha: Double) {
        if saturation.inPercentageRange && lightness.inPercentageRange && alpha.inPercentageRange  {
            self.rawValue = (hue?.asDegree, saturation, lightness)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public var toHSLColor: T {return rawValue}
    public var toDoubleRGB: (red: Percentage, green: Percentage, blue: Percentage) {
        let (hue, saturation, lightness) = rawValue
        return getRGB(hue: hue, saturation: saturation, lightness: lightness)
    }
}

extension HSLColor: ColorManipulationProtocol {}

extension HSLColor: ColorSchemeProtocol {
    public var toInverse: HSLColor {
        return map({(hue: Degree?, saturation: Percentage, lightness: Percentage) in
            let newHue = hue.map{($0 + (degreeMax / 2)).asDegree}
            let newLightness = (percentageMax - lightness).asPercentage
            return (newHue, saturation, newLightness)
        })!
    }
    public var toComplementary: HSLColor {
        return map({(hue: Degree?, saturation: Percentage, lightness: Percentage) in
            let newHue = hue.map{($0 + (degreeMax / 2)).asDegree}
            return (newHue, saturation, lightness)
        })!
    }
    public var toAnalogous: (upper: HSLColor, lower: HSLColor) {
        let upper = map({(hue: Degree?, saturation: Percentage, lightness: Percentage) in
            let newHue = hue.map{($0 + (degreeMax / 12)).asDegree}
            return (newHue, saturation, lightness)
        })!
        let lower = map({(hue: Degree?, saturation: Percentage, lightness: Percentage) in
            let newHue = hue.map{($0 - (degreeMax / 12)).asDegree}
            return (newHue, saturation, lightness)
        })!
        return (upper, lower)
    }
    public var toTriad: (upper: HSLColor, lower: HSLColor) {
        let upper = map({(hue: Degree?, saturation: Percentage, lightness: Percentage) in
            let newHue = hue.map{($0 + (degreeMax / 3)).asDegree}
            return (newHue, saturation, lightness)
        })!
        let lower = map({(hue: Degree?, saturation: Percentage, lightness: Percentage) in
            let newHue = hue.map{($0 - (degreeMax / 3)).asDegree}
            return (newHue, saturation, lightness)
        })!
        return (upper, lower)
    }
    public var toSplitComplementary: (upper: HSLColor, lower: HSLColor) {
        return toComplementary.toAnalogous
    }
}

extension HSLColor: Equatable {
    public static func ==(lhs: HSLColor, rhs: HSLColor) -> Bool {
        let (h1, s1, l1) = lhs.rawValue
        let (h2, s2, l2) = rhs.rawValue
        return h1 == h2 && s1 == s2 && l1 == l2 && lhs.alpha == rhs.alpha
    }
}

extension HSLColor: CustomStringConvertible {
    public var description: String {
        let (h, s, l) = rawValue
        let hue = h.map{String(format: "%.4f", $0)} ?? "undefined"
        let saturation = String(format: "%.4f", s)
        let lightness = String(format: "%.4f", l)
        return "HSLColor <hue: \(hue)˚, saturation: \(saturation)%, lightness: \(lightness)%, alpha: \(alpha)%>"
    }
}
