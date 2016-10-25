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
        let (r, g, b) = toFloatRGB
        return NSColor(colorLiteralRed: r, green: g, blue: b, alpha: Float(alpha))
    }
}
