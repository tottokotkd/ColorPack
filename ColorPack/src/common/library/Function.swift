//
//  Function.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

/// RGB [0% ~ 100%] -> (Hue [0 ~ 360 degree], Saturation & Lightness [0% ~ 100%])
public func getHSL(red: Percentage, green: Percentage, blue: Percentage) -> (hue: Degree?, saturation: Percentage, lightness: Percentage) {
    func getHue(red: Percentage, green: Percentage, blue: Percentage) -> (chroma: Percentage, hue: Degree?) {
        let maxColor = max(red, green, blue)
        let minColor = min(red, green, blue)
        let chroma = maxColor - minColor
        let ratio = degreeMax / 6
        switch (chroma, maxColor) {
        case (0, _):
            return (chroma, nil)
        case (_, red):
            let h = ((green - blue) / chroma).truncatingRemainder(dividingBy: 6)
            return (chroma, h * ratio)
        case (_, green):
            let h = ((blue - red) / chroma) + 2
            return (chroma, h * ratio)
        case (_, blue):
            let h = ((red - green) / chroma) + 4
            return (chroma, h * ratio)
        default:
            return (chroma, nil)
        }
    }
    func getLightness(red: Percentage, green: Percentage, blue: Percentage) -> Percentage {
        let maxColor = max(red, green, blue)
        let minColor = min(red, green, blue)
        return (maxColor + minColor) / 2
    }
    func getSaturation(chroma: Percentage, lightness: Percentage) -> Percentage {
        if lightness == percentageMax {
            return 0
        } else {
            return chroma / (percentageMax - abs(2 * lightness - percentageMax)) * percentageMax
        }
    }
    let (chroma, hue) = getHue(red: red, green: green, blue: blue)
    let lightness = getLightness(red: red, green: green, blue: blue)
    let saturation = getSaturation(chroma: chroma, lightness: lightness)
    return (hue: hue, saturation: saturation, lightness: lightness)
}

/// (Hue [0 ~ 360 degree], Saturation & Lightness [0% ~ 100%]) -> RGB [0% ~ 100%]
public func getRGB(hue: Degree?, saturation: Percentage, lightness: Percentage) -> (red: Percentage, green: Percentage, blue: Percentage) {
    func getBaseRGB(hue: Degree?, chroma: Percentage) -> (red: Percentage, green: Percentage, blue: Percentage) {
        if let hue = hue {
            let h = hue / degreeMax * 6
            let mid = chroma * (1 - abs(h.truncatingRemainder(dividingBy: 2) - 1))
            switch h {
            case 0..<1:
                return (chroma, mid, 0)
            case 0..<2:
                return (mid, chroma, 0)
            case 0..<3:
                return (0, chroma, mid)
            case 0..<4:
                return (0, mid, chroma)
            case 0..<5:
                return (mid, 0, chroma)
            case 0..<6:
                return (chroma, 0, mid)
            default:
                return (0, 0, 0)
            }
        } else {
            return (0, 0, 0)
        }
    }
    let chroma = (percentageMax - abs(2 * lightness - percentageMax)) * saturation / percentageMax
    let (r, g, b) = getBaseRGB(hue: hue, chroma: chroma)
    let min = lightness - chroma / 2
    return (r + min, g + min, b + min)
}
