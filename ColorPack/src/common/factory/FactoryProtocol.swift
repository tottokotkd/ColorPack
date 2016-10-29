//
//  Protocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

public struct Color: ColorFactory {
}

public protocol ColorFactory: IntRGBColorInitializer, DoubleRGBColorInitializer, HSLColorInitializer {
    static func rgb(red: RGBKey, green: RGBKey, blue: RGBKey) -> IntRGBColor
    static func hex(red: HexKey, green: HexKey, blue: HexKey) -> IntRGBColor
    static func hex(keys: HexKeys) -> IntRGBColor
    static func webSafe(red: WebSafeColorKey, green: WebSafeColorKey, blue: WebSafeColorKey) -> IntRGBColor
}
