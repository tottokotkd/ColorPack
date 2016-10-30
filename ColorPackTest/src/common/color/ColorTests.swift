//
//  ConversionTest.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol ColorTestSpec: TestHelper {
    func testOfInitializer()
    func testOfColorCreateMethod()
    func testOfColorTruncateMethod()
    func testOfPropToIntRGBData()
    func testOfPropToDoubleRGBData()
    func testOfPropToHSLData()
    func testOfPropToHexString()
    func testOfDescription()
}

/*
    Int RGB Color
 */
class IntRGBColorColorTests: XCTestCase, ColorTestSpec {
    func testOfInitializer() {
        do {
            XCTAssertNotNil(IntRGBColor(red: rgbMin, green: rgbMin, blue: rgbMin, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: rgbMin, green: rgbMin, blue: rgbMax, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: rgbMin, green: rgbMax, blue: rgbMin, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: rgbMin, green: rgbMax, blue: rgbMax, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: rgbMax, green: rgbMin, blue: rgbMin, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: rgbMax, green: rgbMin, blue: rgbMax, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: rgbMax, green: rgbMax, blue: rgbMin, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: rgbMax, green: rgbMax, blue: rgbMax, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(red: -rgbMin, green: -rgbMin, blue: -rgbMin, alpha: percentageMax))

            XCTAssertNil(IntRGBColor(red: -1, green: 0, blue: 0, alpha: percentageMax))
            XCTAssertNil(IntRGBColor(red: 0, green: -1, blue: 0, alpha: percentageMax))
            XCTAssertNil(IntRGBColor(red: 0, green: 0, blue: -1, alpha: percentageMax))
            XCTAssertNil(IntRGBColor(red: 256, green: 0, blue: 0, alpha: percentageMax))
            XCTAssertNil(IntRGBColor(red: 0, green: 256, blue: 0, alpha: percentageMax))
            XCTAssertNil(IntRGBColor(red: 0, green: 0, blue: 256, alpha: percentageMax))

        }
        do {
            XCTAssertNotNil(IntRGBColor(red: 0, green: 0, blue: 0, alpha: 0))
            XCTAssertNotNil(IntRGBColor(red: 0, green: 0, blue: 0, alpha: 1.0))
            XCTAssertNotNil(IntRGBColor(red: 0, green: 0, blue: 0, alpha: -0.0))

            XCTAssertNil(IntRGBColor(red: 0, green: 0, blue: 0, alpha: -0.1))
            XCTAssertNil(IntRGBColor(red: 0, green: 0, blue: 0, alpha: 100.1))
        }
        do {
            XCTAssertNotNil(IntRGBColor(hex: 0x000000, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(hex: 0xFFFFFF, alpha: percentageMax))
            XCTAssertNotNil(IntRGBColor(hex: -0x000000, alpha: percentageMax))

            XCTAssertNil(IntRGBColor(hex: -0x000001, alpha: percentageMax))
            XCTAssertNil(IntRGBColor(hex: 0xFFFFFF + 1, alpha: percentageMax))
        }
        do {
            XCTAssertNotNil(IntRGBColor(hex: 0x000000, alpha: 0))
            XCTAssertNotNil(IntRGBColor(hex: 0xFFFFFF, alpha: 100.0))
            XCTAssertNotNil(IntRGBColor(hex: 0x000000, alpha: -0))

            XCTAssertNil(IntRGBColor(hex: -0x000001, alpha: -0.1))
            XCTAssertNil(IntRGBColor(hex: 0xFFFFFF, alpha: 100.1))
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let result = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(red, result.rawValue.red)
            XCTAssertEqual(green, result.rawValue.green)
            XCTAssertEqual(blue, result.rawValue.blue)
            XCTAssertEqual(alpha, result.alpha)
        }
    }
    func testOfColorCreateMethod() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let result = Color.create(red: red, green: green, blue: blue)!
            let expected = IntRGBColor(red: red, green: green, blue: blue, alpha: percentageMax)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let hex = red << 16 + green << 8 + blue
            let result = Color.create(hex: hex)!
            let expected = IntRGBColor(red: red, green: green, blue: blue, alpha: percentageMax)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let result = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let expected = IntRGBColor(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let hex = red << 16 + green << 8 + blue
            let result = Color.create(hex: hex, alpha: alpha)!
            let expected = IntRGBColor(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            XCTAssertNil(Color.create(red: randomRGB, green: randomRGB, blue: rgbMax + 1))
            XCTAssertNil(Color.create(red: randomRGB, green: randomRGB, blue: rgbMin - 1))
            XCTAssertNil(Color.create(red: randomRGB, green: randomRGB, blue: randomRGB, alpha: percentageMax + 1))
            XCTAssertNil(Color.create(red: randomRGB, green: randomRGB, blue: randomRGB, alpha: percentageMin - 1))
            XCTAssertNil(Color.create(hex: 0xFFFFFF + 1))
            XCTAssertNil(Color.create(hex: -1))
            XCTAssertNil(Color.create(hex: randomHex, alpha: percentageMax + 1))
            XCTAssertNil(Color.create(hex: randomHex, alpha: percentageMin - 1))
        }
    }
    func testOfColorTruncateMethod() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let result = Color.truncate(red: red, green: green, blue: blue)
            let expected = Color.create(red: red, green: green, blue: blue)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let hex = red << 16 + green << 8 + blue
            let result = Color.truncate(hex: hex)
            let expected = Color.create(hex: hex)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let result = Color.truncate(red: red, green: green, blue: blue, alpha: alpha)
            let expected = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let hex = red << 16 + green << 8 + blue
            let result = Color.truncate(hex: hex, alpha: alpha)
            let expected = Color.create(hex: hex, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            XCTAssertNotNil(Color.truncate(red: randomRGB, green: randomRGB, blue: rgbMax + 1))
            XCTAssertNotNil(Color.truncate(red: randomRGB, green: randomRGB, blue: rgbMin - 1))
            XCTAssertNotNil(Color.truncate(red: randomRGB, green: randomRGB, blue: randomRGB, alpha: percentageMax + 1))
            XCTAssertNotNil(Color.truncate(red: randomRGB, green: randomRGB, blue: randomRGB, alpha: percentageMin - 1))
            XCTAssertNotNil(Color.truncate(hex: 0xFFFFFF + 1))
            XCTAssertNotNil(Color.truncate(hex: -1))
            XCTAssertNotNil(Color.truncate(hex: randomHex, alpha: percentageMax + 1))
            XCTAssertNotNil(Color.truncate(hex: randomHex, alpha: percentageMin - 1))
        }
    }
    func testOfPropToIntRGBData() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let color = Color.create(red: red, green: green, blue: blue)!.toIntRGBData
            XCTAssertEqual(red, color.red)
            XCTAssertEqual(green, color.green)
            XCTAssertEqual(blue, color.blue)
        }
    }
    func testOfPropToDoubleRGBData() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let color = Color.create(red: red, green: green, blue: blue)!.toDoubleRGBData
            XCTAssertEqual(Double(red) / Double(rgbMax) * percentageMax, color.red)
            XCTAssertEqual(Double(green) / Double(rgbMax) * percentageMax, color.green)
            XCTAssertEqual(Double(blue) / Double(rgbMax) * percentageMax, color.blue)
        }
    }
    func testOfPropToHSLData() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let color = Color.create(red: red, green: green, blue: blue)!.toHSLData
            let (hue, saturation, lightness) = getHSL(red: Double(red) / Double(rgbMax) * percentageMax,
                                                      green: Double(green) / Double(rgbMax) * percentageMax,
                                                      blue: Double(blue) / Double(rgbMax) * percentageMax)
            XCTAssertEqual(hue, color.hue)
            XCTAssertEqual(saturation, color.saturation)
            XCTAssertEqual(lightness, color.lightness)
        }
    }
    func testOfPropToHexString() {
        let value = 0x1289FC
        let color = Color.create(hex: value)!
        XCTAssertEqual("1289FC", color.toHexString)
    }
    func testOfDescription() {
        let value = 0xCC9933
        let color = Color.create(hex: value)!
        XCTAssertEqual("IntRGBColor #CC9933 <red: 204, green: 153, blue: 51, alpha: 100.0%>", color.description)
    }
}

/*
    Double RGB Color
 */
class DoubleRGBColorColorTests: XCTestCase, ColorTestSpec {
    func testOfInitializer() {
        do {
            XCTAssertNotNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: 0.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: 100.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: 0.0, green: 1.0, blue: 0.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: 0.0, green: 100.0, blue: 1.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: 100.0, green: 0.0, blue: 0.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: 100.0, green: 0.0, blue: 100.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: 100.0, green: 100.0, blue: 0.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: 100.0, green: 100.0, blue: 100.0, alpha: percentageMax))
            XCTAssertNotNil(DoubleRGBColor(red: -0.0, green: -0.0, blue: -0.0, alpha: percentageMax))

            XCTAssertNil(DoubleRGBColor(red: -1, green: 0.0, blue: 0.0, alpha: percentageMax))
            XCTAssertNil(DoubleRGBColor(red: 0.0, green: -1, blue: 0.0, alpha: percentageMax))
            XCTAssertNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: -1, alpha: percentageMax))
            XCTAssertNil(DoubleRGBColor(red: 100.1, green: 0.0, blue: 0.0, alpha: percentageMax))
            XCTAssertNil(DoubleRGBColor(red: 0.0, green: 100.1, blue: 0.0, alpha: percentageMax))
            XCTAssertNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: 100.1, alpha: percentageMax))
        }
        do {
            XCTAssertNotNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0))
            XCTAssertNotNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
            XCTAssertNotNil(DoubleRGBColor(red: 0, green: 0.0, blue: 0.0, alpha: -0.0))

            XCTAssertNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: 0.0, alpha: -0.1))
            XCTAssertNil(DoubleRGBColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 100.1))
        }
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let result = DoubleRGBColor(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(red, result.rawValue.red)
            XCTAssertEqual(green, result.rawValue.green)
            XCTAssertEqual(blue, result.rawValue.blue)
            XCTAssertEqual(alpha, result.alpha)
        }
    }
    func testOfColorCreateMethod() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let result = Color.create(red: red, green: green, blue: blue)!
            let expected = DoubleRGBColor(red: red, green: green, blue: blue, alpha: percentageMax)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let result = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let expected = DoubleRGBColor(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            XCTAssertNil(Color.create(red: randomPercentage, green: randomPercentage, blue: percentageMax + 1))
            XCTAssertNil(Color.create(red: randomPercentage, green: randomPercentage, blue: percentageMin - 1))
            XCTAssertNil(Color.create(red: randomPercentage, green: randomPercentage, blue: randomPercentage, alpha: percentageMax + 1))
            XCTAssertNil(Color.create(red: randomPercentage, green: randomPercentage, blue: randomPercentage, alpha: percentageMin - 1))
        }
    }
    func testOfColorTruncateMethod() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let result = Color.truncate(red: red, green: green, blue: blue)
            let expected = Color.create(red: red, green: green, blue: blue)!
            XCTAssertEqual(expected, result)
        }
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let result = Color.truncate(red: red, green: green, blue: blue, alpha: alpha)
            let expected = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            XCTAssertNotNil(Color.truncate(red: randomPercentage, green: randomPercentage, blue: percentageMax + 1))
            XCTAssertNotNil(Color.truncate(red: randomPercentage, green: randomPercentage, blue: percentageMin - 1))
            XCTAssertNotNil(Color.truncate(red: randomPercentage, green: randomPercentage, blue: randomPercentage, alpha: percentageMax + 1))
            XCTAssertNotNil(Color.truncate(red: randomPercentage, green: randomPercentage, blue: randomPercentage, alpha: percentageMin - 1))
        }
    }
    func testOfPropToIntRGBData() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue)!.toIntRGBData
            XCTAssertEqual(Int(red / percentageMax * Double(rgbMax)), color.red)
            XCTAssertEqual(Int(green / percentageMax * Double(rgbMax)), color.green)
            XCTAssertEqual(Int(blue / percentageMax * Double(rgbMax)), color.blue)
        }
    }
    func testOfPropToDoubleRGBData() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue)!.toDoubleRGBData
            XCTAssertEqual(red, color.red)
            XCTAssertEqual(green, color.green)
            XCTAssertEqual(blue, color.blue)
        }
    }
    func testOfPropToHSLData() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue)!.toHSLData
            let (hue, saturation, lightness) = getHSL(red: red, green: green, blue: blue)
            XCTAssertEqual(hue, color.hue)
            XCTAssertEqual(saturation, color.saturation)
            XCTAssertEqual(lightness, color.lightness)
        }
    }
    func testOfPropToHexString() {
        let value = 0x80FFFF
        let color = Color.create(hex: value)!.toDoubleRGBColor
        XCTAssertEqual("80FFFF", color.toHexString)
    }
    func testOfDescription() {
        let color = Color.create(red: 80.0, green: 60.0, blue: 20.0)!
        XCTAssertEqual("DoubleRGBColor <red: 80.0%, green: 60.0%, blue: 20.0%, alpha: 100.0%>", color.description)
    }
}

/*
    HSL RGB Color
 */
class HSLColorColorTests: XCTestCase, ColorTestSpec {
    func testOfInitializer() {
        do {
            XCTAssertNotNil(HSLColor(hue: 0, saturation: 0, lightness: 0, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: 0, saturation: 0, lightness: percentageMax, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: 0, saturation: percentageMax, lightness: 0, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: 0, saturation: percentageMax, lightness: percentageMax, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: percentageMax, saturation: 0, lightness: 0, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: percentageMax, saturation: 0, lightness: percentageMax, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: percentageMax, saturation: percentageMax, lightness: 0, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: percentageMax, saturation: percentageMax, lightness: percentageMax, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: -0, saturation: -0, lightness: -0, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: 0, lightness: 0, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: 0, lightness: percentageMax, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: percentageMax, lightness: 0, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: percentageMax, lightness: percentageMax, alpha: percentageMax))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: -0, lightness: -0, alpha: percentageMax))

            XCTAssertNil(HSLColor(hue: 0.0, saturation: percentageMin - 1, lightness: 0.0, alpha: percentageMax))
            XCTAssertNil(HSLColor(hue: 0.0, saturation: 0.0, lightness: percentageMin - 1, alpha: percentageMax))
            XCTAssertNil(HSLColor(hue: 0.0, saturation: percentageMax + 1, lightness: 0.0, alpha: percentageMax))
            XCTAssertNil(HSLColor(hue: 0.0, saturation: 0.0, lightness: percentageMax + 1, alpha: percentageMax))
        }
        do {
            XCTAssertNotNil(HSLColor(hue: 0, saturation: 0, lightness: 0, alpha: 0))
            XCTAssertNotNil(HSLColor(hue: 0, saturation: 0, lightness: 0, alpha: 1.0))
            XCTAssertNotNil(HSLColor(hue: 0, saturation: 0, lightness: 0, alpha: -0.0))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: 0, lightness: 0, alpha: 0))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: 0, lightness: 0, alpha: 1.0))
            XCTAssertNotNil(HSLColor(hue: nil, saturation: 0, lightness: 0, alpha: -0.0))

            XCTAssertNil(HSLColor(hue: 0, saturation: 0, lightness: 0, alpha: percentageMax + 1))
            XCTAssertNil(HSLColor(hue: 0, saturation: 0, lightness: 0, alpha: percentageMin - 1))
            XCTAssertNil(HSLColor(hue: nil, saturation: 0, lightness: 0, alpha: percentageMax + 1))
            XCTAssertNil(HSLColor(hue: nil, saturation: 0, lightness: 0, alpha: percentageMin - 1))
        }
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let result = HSLColor(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            XCTAssertEqual(hue, result.rawValue.hue)
            XCTAssertEqual(saturation, result.rawValue.saturation)
            XCTAssertEqual(lightness, result.rawValue.lightness)
            XCTAssertEqual(alpha, result.alpha)
        }
    }
    func testOfColorCreateMethod() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let result = Color.create(hue: hue, saturation: saturation, lightness: lightness)!
            let expected = HSLColor(hue: hue, saturation: saturation, lightness: lightness, alpha: percentageMax)!
            XCTAssertEqual(expected, result)
        }
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let result = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            let expected = HSLColor(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            XCTAssertNil(Color.create(hue: randomDegree, saturation: randomPercentage, lightness: percentageMax + 1))
            XCTAssertNil(Color.create(hue: randomDegree, saturation: randomPercentage, lightness: percentageMin - 1))
            XCTAssertNil(Color.create(hue: randomDegree, saturation: randomPercentage, lightness: randomPercentage, alpha: percentageMax + 1))
            XCTAssertNil(Color.create(hue: randomDegree, saturation: randomPercentage, lightness: randomPercentage, alpha: percentageMin - 1))
        }
    }
    func testOfColorTruncateMethod() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let result = Color.truncate(hue: hue, saturation: saturation, lightness: lightness)
            let expected = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: percentageMax)!
            XCTAssertEqual(expected, result)
        }
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let result = Color.truncate(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)
            let expected = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            XCTAssertEqual(expected, result)
        }
        do {
            XCTAssertNotNil(Color.truncate(hue: randomDegree, saturation: randomPercentage, lightness: percentageMax + 1))
            XCTAssertNotNil(Color.truncate(hue: randomDegree, saturation: randomPercentage, lightness: percentageMin - 1))
            XCTAssertNotNil(Color.truncate(hue: randomDegree, saturation: randomPercentage, lightness: randomPercentage, alpha: percentageMax + 1))
            XCTAssertNotNil(Color.truncate(hue: randomDegree, saturation: randomPercentage, lightness: randomPercentage, alpha: percentageMin - 1))
        }
    }
    func testOfPropToIntRGBData() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness)!.toIntRGBData
            let (red, green, blue) = getRGB(hue: hue, saturation: saturation, lightness: lightness)
            XCTAssertEqual(Int(red / percentageMax * Double(rgbMax)), color.red)
            XCTAssertEqual(Int(green / percentageMax * Double(rgbMax)), color.green)
            XCTAssertEqual(Int(blue / percentageMax * Double(rgbMax)), color.blue)
        }
    }
    func testOfPropToDoubleRGBData() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness)!.toDoubleRGBData
            let (red, green, blue) = getRGB(hue: hue, saturation: saturation, lightness: lightness)
            XCTAssertEqual(red, color.red)
            XCTAssertEqual(green, color.green)
            XCTAssertEqual(blue, color.blue)
        }
    }
    func testOfPropToHSLData() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness)!.toHSLData
            if let h1 = hue, let h2 = color.hue {
                XCTAssertEqualWithAccuracy(h1, h2, accuracy: 0.001)
            } else {
                XCTAssertNil(hue)
                XCTAssertNil(color.hue)
            }
            XCTAssertEqualWithAccuracy(saturation, color.saturation, accuracy: 0.001)
            XCTAssertEqualWithAccuracy(lightness, color.lightness, accuracy: 0.001)
        }
    }
    func testOfPropToHexString() {
        do {
            let value = 0xA0A324
            let color = Color.create(hex: value)!.toHSLColor
            XCTAssertEqual("A0A324", color.toHexString)
        }
    }
    func testOfDescription() {
        let color = Color.create(hue: 270, saturation: 10, lightness: 20)!
        XCTAssertEqual("HSLColor <hue: 270.0000˚, saturation: 10.0000%, lightness: 20.0000%, alpha: 100.0%>", color.description)
        
    }
}
