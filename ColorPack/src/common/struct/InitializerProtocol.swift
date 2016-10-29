//
//  Protocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

public protocol IntRGBColorInitializer {
    static func create(red: RGB, green: RGB, blue: RGB, alpha: Percentage) -> IntRGBColor?
    static func create(hex: Int, alpha: Percentage) -> IntRGBColor?
    static func truncate(red: RGB, green: RGB, blue: RGB, alpha: Percentage) -> IntRGBColor
    static func truncate(hex: Int, alpha: Percentage) -> IntRGBColor
}
public protocol DoubleRGBColorInitializer {
    static func create(red: Percentage, green: Percentage, blue: Percentage, alpha: Percentage) -> DoubleRGBColor?
    static func truncate(red: Percentage, green: Percentage, blue: Percentage, alpha: Percentage) -> DoubleRGBColor
}
public protocol HSLColorInitializer {
    static func create(hue: Degree?, saturation: Percentage, lightness: Percentage, alpha: Percentage) -> HSLColor?
    static func truncate(hue: Degree?, saturation: Percentage, lightness: Percentage, alpha: Percentage) -> HSLColor
}
public protocol ColorStructConvertor: ColorProtocol, ColorFactory {
    var toIntRGBColor: IntRGBColor {get}
    var toDoubleRGBColor: DoubleRGBColor {get}
    var toHSLColor: HSLColor {get}
}
extension ColorStructConvertor {
    public var toIntRGBColor: IntRGBColor {
        let (red, green, blue) = toIntRGB
        return Color.create(red: red, green: green, blue: blue, alpha: alpha)!
    }
    public var toDoubleRGBColor: DoubleRGBColor {
        let (red, green, blue) = toDoubleRGB
        return Color.create(red: red, green: green, blue: blue, alpha: alpha)!
    }
    public var toHSLColor: HSLColor {
        let (hue, saturation, lightness) = toHSL
        return Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
    }
}
