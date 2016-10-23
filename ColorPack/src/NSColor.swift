//
//  Util.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import AppKit

extension Color {
    public var toNSColor: NSColor {
        let (r, g, b, a) = toFloat
        return NSColor(colorLiteralRed: r, green: g, blue: b, alpha: a)
    }
}
