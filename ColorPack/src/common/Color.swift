//
//  ColorProtocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

public struct Color: ColorFactory {}
public protocol ColorInitializer {
    static func create(red: Int, green: Int, blue: Int, alpha: Double) -> ColorProtocol?
    static func create(hex: Int, alpha: Double) -> ColorProtocol?
    static func create(red: Double, green: Double, blue: Double, alpha: Double) -> ColorProtocol?
}
public protocol ColorFactory: ColorInitializer {
    static func webSafe(red: WebSafeColorKey, green: WebSafeColorKey, blue: WebSafeColorKey) -> ColorProtocol
    static func rgb(red: RGB, green: RGB, blue: RGB) -> ColorProtocol
    static func hex(red: Hex, green: Hex, blue: Hex) -> ColorProtocol
    static func hex(keys: HexKeys) -> ColorProtocol
}

public protocol ColorProtocol {
    var alpha: Double {get}
    var toHexString: String {get}
    var toIntRGB: (red: Int, green: Int, blue: Int) {get}
    var toFloatRGB: (red: Float, green: Float, blue: Float) {get}
    var toDoubleRGB: (red: Double, green: Double, blue: Double) {get}
}

extension ColorProtocol {
    public var toHexString: String {
        let (r, g, b) = toIntRGB
        return String(format:"%02X", r) + String(format:"%02X", g) + String(format:"%02X", b)
    }
    public var toIntRGB: (red: Int, green: Int, blue: Int) {
        let (r, g, b) = toDoubleRGB
        return (Int(r * 255.0), Int(g * 255.0), Int(b * 255.0))
    }
    public var toDoubleRGB: (red: Double, green: Double, blue: Double) {
        let (r, g, b) = toIntRGB
        return (Double(r) / 255.0, Double(g) / 255.0, Double(b) / 255.0)
    }
    public var toFloatRGB: (red: Float, green: Float, blue: Float) {
        let (r, g, b) = toDoubleRGB
        return (Float(r), Float(g), Float(b))
    }
    public func description() -> String {
        let (r, g, b) = toDoubleRGB
        return "\(type(of: self)) <red: \(r), green: \(g), blue: \(b), alpha: \(alpha)>"
    }
}
