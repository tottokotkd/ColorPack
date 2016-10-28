//
//  ColorProtocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorProtocol {
    public var toIntRGB: (red: RGB, green: RGB, blue: RGB) {
        let (r, g, b) = toDoubleRGB
        let red = r / percentageMax * Double(rgbMax)
        let green = g / percentageMax * Double(rgbMax)
        let blue = b / percentageMax * Double(rgbMax)
        return (RGB(red), RGB(green), RGB(blue))
    }
    public var toDoubleRGB: (red: Percentage, green: Percentage, blue: Percentage) {
        let (r, g, b) = toIntRGB
        let red = Double(r) / Double(rgbMax) * percentageMax
        let green = Double(g) / Double(rgbMax) * percentageMax
        let blue = Double(b) / Double(rgbMax) * percentageMax
        return (Percentage(red), Percentage(green), Percentage(blue))
    }
    public var toHSL: (hue: Degree?, saturation: Percentage, lightness: Percentage) {
        let (red, green, blue) = toDoubleRGB
        return getHSL(red: red, green: green, blue: blue)
    }
    public var toHexString: String {
        let (r, g, b) = toIntRGB
        return String(format:"%02X", r) + String(format:"%02X", g) + String(format:"%02X", b)
    }
}
