//
//  utility.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/27.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

/// 0...255
public typealias RGB = Int
public let rgbMin = 0
public let rgbMax = 255
public let rgbRange = rgbMin...rgbMax
public typealias IntRGBData = (red: RGB, green: RGB, blue: RGB)

public typealias Hex = Int
public let hexMin = 0x000000
public let hexMax = 0xFFFFFF
public let hexRange = hexMin...hexMax
public typealias DoubleRGBData = (red: Percentage, green: Percentage, blue: Percentage)

/// 0...100
public typealias Percentage = Double
public let percentageMin: Percentage = 0.0
public let percentageMax: Percentage = 100.0
public let percentageRange = percentageMin...percentageMax
public typealias HSLData = (hue: Degree?, saturation: Percentage, lightness: Percentage)

/// 0..<360
public typealias Degree = Double
public let degreeMin: Degree = 0.0
public let degreeMax: Degree = 360.0

extension Int {
    var asRGB: RGB {
        return Swift.min(rgbMax, Swift.max(rgbMin, self))
    }
    var asHex: Hex {
        return Swift.min(hexMax, Swift.max(hexMin, self))
    }
    var inRGBRange: Bool {return rgbRange ~= self}
    var inHexRange: Bool {return hexRange ~= self}
}


extension Double {
    var asPercentage: Percentage {
        return min(percentageMax, max(percentageMin, self))
    }
    var asDegree: Degree {
        let truncated = self.truncatingRemainder(dividingBy: degreeMax)
        return truncated >= degreeMin ? truncated : truncated + degreeMax
    }
    var inPercentageRange: Bool {return percentageRange ~= self}
 
}
