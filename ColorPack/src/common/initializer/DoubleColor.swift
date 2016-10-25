//
//  Util.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import Foundation

extension ColorInitializer {
    public static func create(red: Double, green: Double, blue: Double, alpha: Double = 1.0) -> ColorProtocol? {
        return DoubleColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

private struct DoubleColor: ColorProtocol {
    public let intRGB: (red: Int, green: Int, blue: Int)
    public let alpha: Double
    public init?(red: Double, green: Double, blue: Double, alpha: Double) {
        if 0...1 ~= red && 0...1 ~= green && 0...1 ~= blue && 0...1 ~= alpha  {
            self.intRGB = (Int(red * 255.0), Int(green * 255.0), Int(blue * 255.0))
            self.alpha = alpha
        } else {
            return nil
        }
    }
}
