//
//  ColorProtocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorProtocol {
    public var toIntRGB: (red: Int, green: Int, blue: Int) {
        let (r, g, b) = toDoubleRGB
        return (Int(r * 255), Int(g * 255), Int(b * 255))
    }
    public var toFloatRGB: (red: Float, green: Float, blue: Float) {
        let (r, g, b) = toDoubleRGB
        return (Float(r), Float(g), Float(b))
    }
    public var toDoubleRGB: (red: Double, green: Double, blue: Double) {
        let (r, g, b) = toIntRGB
        return (Double(r) / 255.0, Double(g) / 255.0, Double(b) / 255.0)
    }
    public var toHexString: String {
        let (r, g, b) = toIntRGB
        return String(format:"%02X", r) + String(format:"%02X", g) + String(format:"%02X", b)
    }
}
