//
//  File.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/22.
//
//

import UIKit

extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int) {
        self.init(colorLiteralRed: Float(red) / 255.0, green: Float(green) / 255.0, blue: Float(blue) / 255.0, alpha: 1)
    }
}

extension Color {
    var toColor: UIColor {return UIColor(red: red, green: green, blue: blue)}    
}
