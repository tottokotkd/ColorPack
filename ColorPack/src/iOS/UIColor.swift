//
//  File.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import UIKit

extension ColorProtocol {
    public var toUIColor: UIColor {
        let (r, g, b) = toFloatRGB
        return UIColor(colorLiteralRed: r, green: g, blue: b, alpha: Float(alpha))
    }
}
