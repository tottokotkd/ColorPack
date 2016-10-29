//
//  WebSafeColor.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/23.
//  Copyright © 2016 tottokotkd. All rights reserved.
//

import Foundation

extension ColorFactory {
    public static func webSafe(red: WebSafeColorKey, green: WebSafeColorKey, blue: WebSafeColorKey) -> IntRGBColor {
        return Self.create(red: red.rawValue, green: green.rawValue, blue: blue.rawValue)!
    }
}

public enum WebSafeColorKey: RGB {
    case k0 = 0x0
    case k3 = 0x33
    case k6 = 0x66
    case k9 = 0x99
    case kC = 0xCC
    case kF = 0xFF
}
