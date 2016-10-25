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
    public let toDoubleRGB: (red: Double, green: Double, blue: Double)
    public let alpha: Double
    public init?(red: Double, green: Double, blue: Double, alpha: Double) {
        if 0...1 ~= red && 0...1 ~= green && 0...1 ~= blue && 0...1 ~= alpha  {
            self.toDoubleRGB = (red, green, blue)
            self.alpha = alpha
        } else {
            return nil
        }
    }
}
