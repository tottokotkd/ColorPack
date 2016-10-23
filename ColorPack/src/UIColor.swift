//
//  File.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import UIKit

extension Color {
    public var toUIColor: UIColor {
        let (r, g, b, a) = toFloat
        return UIColor(colorLiteralRed: r, green: g, blue: b, alpha: a)
    }
}
