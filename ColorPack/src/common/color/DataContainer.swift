//
//  ColorProtocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorDataContainerProtocol {
    public var toIntRGBData: IntRGBData {
        let (r, g, b) = toDoubleRGBData
        let red = r / percentageMax * Double(rgbMax)
        let green = g / percentageMax * Double(rgbMax)
        let blue = b / percentageMax * Double(rgbMax)
        return (RGB(red), RGB(green), RGB(blue))
    }
    public var toDoubleRGBData: DoubleRGBData {
        let (r, g, b) = toIntRGBData
        let red = Double(r) / Double(rgbMax) * percentageMax
        let green = Double(g) / Double(rgbMax) * percentageMax
        let blue = Double(b) / Double(rgbMax) * percentageMax
        return (Percentage(red), Percentage(green), Percentage(blue))
    }
    public var toHSLData: HSLData {
        let (red, green, blue) = toDoubleRGBData
        return getHSL(red: red, green: green, blue: blue)
    }
    public var toHexString: String {
        let (r, g, b) = toIntRGBData
        return String(format:"%02X", r) + String(format:"%02X", g) + String(format:"%02X", b)
    }
}
