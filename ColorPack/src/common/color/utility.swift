//
//  utility.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/27.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

func truncateAlphaValue(_ value: Double) -> Double {
    return max(min(value, 1), 0)
}
