//
//  Util.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import AppKit

extension ColorProtocol {
    public var toNSColor: NSColor {
        let (r, g, b) = toDoubleRGBData
        let red = r / percentageMax
        let green = g / percentageMax
        let blue = b / percentageMax
        let newAlpha = alpha / percentageMax
        return NSColor(colorLiteralRed: Float(red), green: Float(green), blue: Float(blue), alpha: Float(newAlpha))
    }
}
