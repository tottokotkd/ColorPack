//
//  Util.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import Foundation

public struct Color {
    public let red: Int
    public let green: Int
    public let blue: Int
    public let alpha: Double
    public init?(red: Int, green: Int, blue: Int, alpha: Double = 1.0) {
        if 0...255 ~= red && 0...255 ~= green && 0...255 ~= blue && 0...1 ~= alpha  {
            self.red = red
            self.green = green
            self.blue = blue
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public init?(hex: Int, alpha: Double = 1.0) {
        if 0...0xFFFFFF ~= hex && 0...1 ~= alpha {
            red = (hex & 0xFF0000) >> 16
            green = (hex & 0x00FF00) >> 8
            blue = hex & 0x0000FF
            self.alpha = alpha
        } else {
            return nil
        }
    }
    public var toFloat: (red: Float, green: Float, blue: Float, alpha: Float) {
        let r = Float(red) / 255.0
        let g = Float(green) / 255.0
        let b = Float(blue) / 255.0
        let a = Float(alpha)
        return (r, g, b, a)        
    }
}
