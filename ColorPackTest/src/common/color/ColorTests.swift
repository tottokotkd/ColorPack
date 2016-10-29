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
    func testOfPropToIntRGB()
    func testOfPropToDoubleRGB()
    func testOfPropToHSL()
    func testOfPropToHexString()
    func testOfDescription()
}

/*
    Int RGB Color
 */
class IntRGBColorColorConversionTests: XCTestCase, ColorTestSpec {
    func testOfInitializer() {
        do {
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0))
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 255))
            XCTAssertNotNil(Color.create(red: 0, green: 255, blue: 0))
            XCTAssertNotNil(Color.create(red: 0, green: 255, blue: 255))
            XCTAssertNotNil(Color.create(red: 255, green: 0, blue: 0))
            XCTAssertNotNil(Color.create(red: 255, green: 0, blue: 255))
            XCTAssertNotNil(Color.create(red: 255, green: 255, blue: 0))
            XCTAssertNotNil(Color.create(red: 255, green: 255, blue: 255))
            XCTAssertNotNil(Color.create(red: -0, green: -0, blue: -0))

            XCTAssertNil(Color.create(red: -1, green: 0, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: -1, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: 0, blue: -1))
            XCTAssertNil(Color.create(red: 256, green: 0, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: 256, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: 0, blue: 256))

        }
        do {
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0, alpha: 0))
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0, alpha: 1.0))
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0, alpha: -0.0))

            XCTAssertNil(Color.create(red: 0, green: 0, blue: 0, alpha: -0.1))
            XCTAssertNil(Color.create(red: 0, green: 0, blue: 0, alpha: 100.1))
        }
        do {
            XCTAssertNotNil(Color.create(hex: 0x000000))
            XCTAssertNotNil(Color.create(hex: 0xFFFFFF))
            XCTAssertNotNil(Color.create(hex: -0x000000))

            XCTAssertNil(Color.create(hex: -0x000001))
            XCTAssertNil(Color.create(hex: 0xFFFFFF + 1))
        }
        do {
            XCTAssertNotNil(Color.create(hex: 0x000000, alpha: 0))
            XCTAssertNotNil(Color.create(hex: 0xFFFFFF, alpha: 100.0))
            XCTAssertNotNil(Color.create(hex: 0x000000, alpha: -0))

            XCTAssertNil(Color.create(hex: -0x000001, alpha: -0.1))
            XCTAssertNil(Color.create(hex: 0xFFFFFF, alpha: 100.1))
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
    func testOfPropToIntRGB() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let color = Color.create(red: red, green: green, blue: blue)!.toIntRGB
            XCTAssertEqual(red, color.red)
            XCTAssertEqual(green, color.green)
            XCTAssertEqual(blue, color.blue)
        }
    }
    func testOfPropToDoubleRGB() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let color = Color.create(red: red, green: green, blue: blue)!.toDoubleRGB
            XCTAssertEqual(Double(red) / Double(rgbMax) * percentageMax, color.red)
            XCTAssertEqual(Double(green) / Double(rgbMax) * percentageMax, color.green)
            XCTAssertEqual(Double(blue) / Double(rgbMax) * percentageMax, color.blue)
        }
    }
    func testOfPropToHSL() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let color = Color.create(red: red, green: green, blue: blue)!.toHSL
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
class DoubleRGBColorColorConversionTests: XCTestCase, ColorTestSpec {
    func testOfInitializer() {
        do {
            XCTAssertNotNil(Color.create(red: 0.0, green: 0.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 0.0, green: 0.0, blue: 100.0))
            XCTAssertNotNil(Color.create(red: 0.0, green: 1.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 0.0, green: 100.0, blue: 1.0))
            XCTAssertNotNil(Color.create(red: 100.0, green: 0.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 100.0, green: 0.0, blue: 100.0))
            XCTAssertNotNil(Color.create(red: 100.0, green: 100.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 100.0, green: 100.0, blue: 100.0))
            XCTAssertNotNil(Color.create(red: -0.0, green: -0.0, blue: -0.0))

            XCTAssertNil(Color.create(red: -1, green: 0.0, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: -1, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: -1))
            XCTAssertNil(Color.create(red: 100.1, green: 0.0, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 100.1, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: 100.1))
        }
        do {
            XCTAssertNotNil(Color.create(red: 0.0, green: 0.0, blue: 0.0, alpha: 0))
            XCTAssertNotNil(Color.create(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
            XCTAssertNotNil(Color.create(red: 0, green: 0.0, blue: 0.0, alpha: -0.0))

            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: 0.0, alpha: -0.1))
            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: 0.0, alpha: 100.1))
        }
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let result = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            XCTAssertEqual(red, result.rawValue.red)
            XCTAssertEqual(green, result.rawValue.green)
            XCTAssertEqual(blue, result.rawValue.blue)
            XCTAssertEqual(alpha, result.alpha)
        }
    }
    func testOfPropToIntRGB() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue)!.toIntRGB
            XCTAssertEqual(Int(red / percentageMax * Double(rgbMax)), color.red)
            XCTAssertEqual(Int(green / percentageMax * Double(rgbMax)), color.green)
            XCTAssertEqual(Int(blue / percentageMax * Double(rgbMax)), color.blue)
        }
    }
    func testOfPropToDoubleRGB() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue)!.toDoubleRGB
            XCTAssertEqual(red, color.red)
            XCTAssertEqual(green, color.green)
            XCTAssertEqual(blue, color.blue)
        }
    }
    func testOfPropToHSL() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue)!.toHSL
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
class HSLColorColorConversionTests: XCTestCase, ColorTestSpec {
    func testOfInitializer() {
        do {
            XCTAssertNotNil(Color.create(hue: 0, saturation: 0, lightness: 0))
            XCTAssertNotNil(Color.create(hue: 0, saturation: 0, lightness: percentageMax))
            XCTAssertNotNil(Color.create(hue: 0, saturation: percentageMax, lightness: 0))
            XCTAssertNotNil(Color.create(hue: 0, saturation: percentageMax, lightness: percentageMax))
            XCTAssertNotNil(Color.create(hue: percentageMax, saturation: 0, lightness: 0))
            XCTAssertNotNil(Color.create(hue: percentageMax, saturation: 0, lightness: percentageMax))
            XCTAssertNotNil(Color.create(hue: percentageMax, saturation: percentageMax, lightness: 0))
            XCTAssertNotNil(Color.create(hue: percentageMax, saturation: percentageMax, lightness: percentageMax))
            XCTAssertNotNil(Color.create(hue: -0, saturation: -0, lightness: -0))
            XCTAssertNotNil(Color.create(hue: nil, saturation: 0, lightness: 0))
            XCTAssertNotNil(Color.create(hue: nil, saturation: 0, lightness: percentageMax))
            XCTAssertNotNil(Color.create(hue: nil, saturation: percentageMax, lightness: 0))
            XCTAssertNotNil(Color.create(hue: nil, saturation: percentageMax, lightness: percentageMax))
            XCTAssertNotNil(Color.create(hue: nil, saturation: -0, lightness: -0))

            XCTAssertNil(Color.create(red: percentageMin - 1, green: 0.0, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: percentageMin - 1, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: percentageMin - 1))
            XCTAssertNil(Color.create(red: percentageMax + 1, green: 0.0, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: percentageMax + 1, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: percentageMax + 1))
        }
        do {
            XCTAssertNotNil(Color.create(hue: 0, saturation: 0, lightness: 0, alpha: 0))
            XCTAssertNotNil(Color.create(hue: 0, saturation: 0, lightness: 0, alpha: 1.0))
            XCTAssertNotNil(Color.create(hue: 0, saturation: 0, lightness: 0, alpha: -0.0))
            XCTAssertNotNil(Color.create(hue: nil, saturation: 0, lightness: 0, alpha: 0))
            XCTAssertNotNil(Color.create(hue: nil, saturation: 0, lightness: 0, alpha: 1.0))
            XCTAssertNotNil(Color.create(hue: nil, saturation: 0, lightness: 0, alpha: -0.0))

            XCTAssertNil(Color.create(hue: 0, saturation: 0, lightness: 0, alpha: percentageMax + 1))
            XCTAssertNil(Color.create(hue: 0, saturation: 0, lightness: 0, alpha: percentageMin - 1))
            XCTAssertNil(Color.create(hue: nil, saturation: 0, lightness: 0, alpha: percentageMax + 1))
            XCTAssertNil(Color.create(hue: nil, saturation: 0, lightness: 0, alpha: percentageMin - 1))
        }
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let result = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            XCTAssertEqual(hue, result.rawValue.hue)
            XCTAssertEqual(saturation, result.rawValue.saturation)
            XCTAssertEqual(lightness, result.rawValue.lightness)
            XCTAssertEqual(alpha, result.alpha)
        }
    }
    func testOfPropToIntRGB() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness)!.toIntRGB
            let (red, green, blue) = getRGB(hue: hue, saturation: saturation, lightness: lightness)
            XCTAssertEqual(Int(red / percentageMax * Double(rgbMax)), color.red)
            XCTAssertEqual(Int(green / percentageMax * Double(rgbMax)), color.green)
            XCTAssertEqual(Int(blue / percentageMax * Double(rgbMax)), color.blue)
        }
    }
    func testOfPropToDoubleRGB() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness)!.toDoubleRGB
            let (red, green, blue) = getRGB(hue: hue, saturation: saturation, lightness: lightness)
            XCTAssertEqual(red, color.red)
            XCTAssertEqual(green, color.green)
            XCTAssertEqual(blue, color.blue)
        }
    }
    func testOfPropToHSL() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness)!.toHSL
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
