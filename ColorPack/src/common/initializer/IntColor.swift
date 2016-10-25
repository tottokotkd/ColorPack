//
//  IntRGBColor.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorInitializer {
    public static func create(red: Int, green: Int, blue: Int, alpha: Double = 1.0) -> ColorProtocol? {
        return IntColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    public static func create(hex: Int, alpha: Double = 1.0) -> ColorProtocol? {
        return IntColor(hex: hex, alpha: alpha)
    }
}

private struct IntColor: ColorProtocol {
    public let intRGB: (red: Int, green: Int, blue: Int)
    public let alpha: Double
    public init?(red: Int, green: Int, blue: Int, alpha: Double) {
        if 0...255 ~= red && 0...255 ~= green && 0...255 ~= blue && 0...1 ~= alpha  {
            self.intRGB = (red, green, blue)
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
            self.intRGB = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public func description() -> String {
        let (r, g, b) = intRGB
        return "\(type(of: self)) #\(toHexString) <red: \(r), green: \(g), blue: \(b), alpha: \(alpha)>"
    }
}
