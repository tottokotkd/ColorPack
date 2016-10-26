//
//  Utility.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/26.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorInitializer {
    public static func truncateColorValue(_ value: Double) -> Double {
        return max(min(value, 1), 0)
    }
    public static func truncateColorValue(_ value: Int) -> Int {
        return max(min(value, 255), 0)
    }
    public static func truncateAlphaValue(_ value: Double) -> Double {
        return max(min(value, 1), 0)
    }
}
