//
//  Inheritance.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/26.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorProtocol {
    public var description: String {
        let (r, g, b) = intRGB
        return "\(type(of: self)) <red: \(r), green: \(g), blue: \(b), alpha: \(alpha)>"
    }
}
