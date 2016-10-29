//
//  ColorModelConversionTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol ColorModelConversionTestSpec: TestHelper {
    func testOfGetHSL()
    func testOfGetRGB()
}

class ColorModelConversionTests: XCTestCase, ColorModelConversionTestSpec {
    func testOfGetHSL() {
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xFF) / Percentage(rgbMax) * 100.0,
                                                      green: Percentage(0xFF) / Percentage(rgbMax) * 100.0,
                                                      blue: Percentage(0xFF) / Percentage(rgbMax) * 100.0)
            XCTAssertNil(hue)
            XCTAssertEqualWithAccuracy(0.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(100.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x80) / Percentage(rgbMax) * 100.0,
                                                      green: Percentage(0x80) / Percentage(rgbMax) * 100.0,
                                                      blue: Percentage(0x80) / Percentage(rgbMax) * 100.0)
            XCTAssertNil(hue)
            XCTAssertEqualWithAccuracy(0.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(50.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x00) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x00) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x00) / Percentage(rgbMax) * 100.0)
            XCTAssertNil(hue)
            XCTAssertEqualWithAccuracy(0.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(0.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xFF) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x00) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x00) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(0.0, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(100.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(50.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xBF) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0xBF) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x00) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(60.0, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(100.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(37.5, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x00) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x80) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x00) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(120.0, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(100.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(25.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x80) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0xFF) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0xFF) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(180.0, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(100.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(75.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x80) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x80) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0xFF) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(240.0, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(100.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(75.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xBF) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x40) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0xBF) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(300.0, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(50.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(50.0, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xA0) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0xA4) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x24) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(61.8, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(63.8, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(39.3, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x41) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x1B) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0xEA) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(251.1, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(83.2, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(51.1, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x1E) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0xAC) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x41) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(134.9, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(70.7, saturation, accuracy: 0.5)
            XCTAssertEqualWithAccuracy(39.6, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xF0) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0xC8) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x0E) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(49.5, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(89.3, saturation, accuracy: 0.4)
            XCTAssertEqualWithAccuracy(49.7, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xB4) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x30) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0xE5) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(283.7, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(77.5, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(54.2, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xED) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x76) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x51) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(14.3, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(81.7, saturation, accuracy: 0.5)
            XCTAssertEqualWithAccuracy(62.4, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0xFE) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0xF8) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x88) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(56.9, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(99.1, saturation, accuracy: 0.8)
            XCTAssertEqualWithAccuracy(76.5, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x19) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0xCB) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x97) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(162.4, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(77.9, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(44.7, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x36) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x26) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0x98) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(248.3, hue!, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(60.1, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(37.3, lightness, accuracy: 0.2)
        }
        do {
            let (hue, saturation, lightness) = getHSL(red: Percentage(0x7E) / Percentage(rgbMax) * 100.0,
                                     green: Percentage(0x7E) / Percentage(rgbMax) * 100.0,
                                     blue: Percentage(0xB8) / Percentage(rgbMax) * 100.0)
            XCTAssertEqualWithAccuracy(240.5, hue!, accuracy: 0.5)
            XCTAssertEqualWithAccuracy(29.0, saturation, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(60.7, lightness, accuracy: 0.2)
        }
    }
    func testOfGetRGB() {
        do {
            let (red, green, blue) = getRGB(hue: nil, saturation: 0.0, lightness: 100.0)
            XCTAssertEqualWithAccuracy(Double(0xFF) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xFF) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xFF) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: nil, saturation: 0.0, lightness: 50.0)
            XCTAssertEqualWithAccuracy(Double(0x80) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x80) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x80) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: nil, saturation: 0.0, lightness: 0.0)
            XCTAssertEqualWithAccuracy(Double(0x00) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x00) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x00) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 0.0, saturation: 100.0, lightness: 50.0)
            XCTAssertEqual(Double(0xFF) / Double(rgbMax) * percentageMax, red)
            XCTAssertEqual(Double(0x00) / Double(rgbMax) * percentageMax, green)
            XCTAssertEqual(Double(0x00) / Double(rgbMax) * percentageMax, blue)
        }
        do {
            let (red, green, blue) = getRGB(hue: 60.0, saturation: 100.0, lightness: 37.5)
            XCTAssertEqualWithAccuracy(Double(0xBF) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xBF) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x00) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 120.0, saturation: 100.0, lightness: 25.0)
            XCTAssertEqualWithAccuracy(Double(0x00) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x80) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x00) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 180.0, saturation: 100.0, lightness: 75.0)
            XCTAssertEqualWithAccuracy(Double(0x80) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xFF) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xFF) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 240.0, saturation: 100.0, lightness: 75.0)
            XCTAssertEqualWithAccuracy(Double(0x80) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x80) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xFF) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 300.0, saturation: 50.0, lightness: 50.0)
            XCTAssertEqualWithAccuracy(Double(0xBF) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x40) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xBF) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 61.8, saturation: 63.8, lightness: 39.3)
            XCTAssertEqualWithAccuracy(Double(0xA0) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xA4) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x24) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 251.1, saturation: 83.2, lightness: 51.1)
            XCTAssertEqualWithAccuracy(Double(0x41) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x1B) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xEA) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 134.9, saturation: 70.7, lightness: 39.6)
            XCTAssertEqualWithAccuracy(Double(0x1E) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xAC) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x41) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 49.5, saturation: 89.3, lightness: 49.7)
            XCTAssertEqualWithAccuracy(Double(0xF0) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xC8) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x0E) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 283.7, saturation: 77.5, lightness: 54.2)
            XCTAssertEqualWithAccuracy(Double(0xB4) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x30) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xE5) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 14.3, saturation: 81.7, lightness: 62.4)
            XCTAssertEqualWithAccuracy(Double(0xED) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x76) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x51) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 56.9, saturation: 99.1, lightness: 76.5)
            XCTAssertEqualWithAccuracy(Double(0xFE) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xF8) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x88) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 162.4, saturation: 77.9, lightness: 44.7)
            XCTAssertEqualWithAccuracy(Double(0x19) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xCB) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x97) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 248.3, saturation: 60.1, lightness: 37.3)
            XCTAssertEqualWithAccuracy(Double(0x36) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x26) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x98) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
        do {
            let (red, green, blue) = getRGB(hue: 240.5, saturation: 29.0, lightness: 60.7)
            XCTAssertEqualWithAccuracy(Double(0x7E) / Double(rgbMax) * percentageMax, red, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0x7E) / Double(rgbMax) * percentageMax, green, accuracy: 0.2)
            XCTAssertEqualWithAccuracy(Double(0xB8) / Double(rgbMax) * percentageMax, blue, accuracy: 0.2)
        }
    }
}
