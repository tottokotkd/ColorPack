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
        let (r, g, b) = toDoubleRGBData
        let red = r / percentageMax
        let green = g / percentageMax
        let blue = b / percentageMax
        let newAlpha = alpha / percentageMax
        return UIColor(colorLiteralRed: Float(red), green: Float(green), blue: Float(blue), alpha: Float(newAlpha))
    }
}
