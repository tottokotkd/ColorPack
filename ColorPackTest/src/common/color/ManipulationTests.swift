//
//  ManipulationTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol ManipulationTestSpec: TestHelper {
    func testOfMap()
    func testOfMapAlpha()
    func testOfMerge()
    func testOfMergeAlpha()
    func testOfWithAlpha()
}

extension ManipulationTestSpec {
    func testOfWithAlphaImpl<C: ColorManipulationProtocol>(color: C) {
        do {
            let result = color.withAlpha(0.9)!
            assertEqualColor(color, result)
            XCTAssertEqual(0.9, result.alpha)
        }
        do {
            let result = color.withAlpha(100.9)
            XCTAssertNil(result)
        }
    }
}

/*
    Int RGB Color
 */
class IntRGBColorManipulationOperatorSpec: XCTestCase, ManipulationTestSpec {
    func testOfMap() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map{(r, g, b) in (r / 2, g / 3, b / 4)}!
            XCTAssertEqual(red / 2, result.toIntRGB.red)
            XCTAssertEqual(green / 3, result.toIntRGB.green)
            XCTAssertEqual(blue / 4, result.toIntRGB.blue)
            XCTAssertEqual(alpha, result.alpha)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map{(r, g, b) in (r, g, rgbMax + 1)}
            XCTAssertNil(result)
        }
    }
    func testOfMapAlpha() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformAlpha:{$0 / 2})!
            XCTAssertEqual(red, result.toIntRGB.red)
            XCTAssertEqual(green, result.toIntRGB.green)
            XCTAssertEqual(blue, result.toIntRGB.blue)
            XCTAssertEqual(alpha / 2, result.alpha)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformAlpha:{_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
    func testOfMerge() {
        do {
            let red1 = randomRGB
            let red2 = randomRGB
            let green1 = randomRGB
            let green2 = randomRGB
            let blue1 = randomRGB
            let blue2 = randomRGB
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2) { (x: IntRGBData, y: IntRGBData) in
                let r = abs(x.red - y.red)
                let g = abs(x.green - y.green)
                let b = abs(x.blue - y.blue)
                return (r, g, b)
            }!
            XCTAssertEqual(abs(red1 - red2), result.toIntRGB.red)
            XCTAssertEqual(abs(green1 - green2), result.toIntRGB.green)
            XCTAssertEqual(abs(blue1 - blue2), result.toIntRGB.blue)
            XCTAssertEqual(alpha1, result.alpha)
        }
        do {
            let red1 = randomRGB
            let red2 = randomRGB
            let green1 = randomRGB
            let green2 = randomRGB
            let blue1 = randomRGB
            let blue2 = randomRGB
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2) { (x: IntRGBData, y: IntRGBData) in
                let r = rgbMax + 1
                let g = abs(x.green - y.green)
                let b = abs(x.blue - y.blue)
                return (r, g, b)
            }
            XCTAssertNil(result)
        }
    }
    func testOfMergeAlpha() {
        do {
            let red1 = randomRGB
            let red2 = randomRGB
            let green1 = randomRGB
            let green2 = randomRGB
            let blue1 = randomRGB
            let blue2 = randomRGB
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformAlpha: {abs($0 - $1)})!
            XCTAssertEqual(red1, result.toIntRGB.red)
            XCTAssertEqual(green1, result.toIntRGB.green)
            XCTAssertEqual(blue1, result.toIntRGB.blue)
            XCTAssertEqual(abs(alpha1 - alpha2), result.alpha)
        }
        do {
            let red1 = randomRGB
            let red2 = randomRGB
            let green1 = randomRGB
            let green2 = randomRGB
            let blue1 = randomRGB
            let blue2 = randomRGB
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformAlpha: {_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
    func testOfWithAlpha() {
        testOfWithAlphaImpl(color: randomIntRGBColor)
    }
    
    // rgb color only
    func testOfMapColor() {
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformColor: {$0 / 2})!
            XCTAssertEqual(red / 2, result.toIntRGB.red)
            XCTAssertEqual(green / 2, result.toIntRGB.green)
            XCTAssertEqual(blue / 2, result.toIntRGB.blue)
            XCTAssertEqual(alpha, result.alpha)
        }
        do {
            let red = randomRGB
            let green = randomRGB
            let blue = randomRGB
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformColor:{_ in rgbMax + 1})
            XCTAssertNil(result)
        }
    }

    func testOfMergeColor() {
        do {
            let red1 = randomRGB
            let red2 = randomRGB
            let green1 = randomRGB
            let green2 = randomRGB
            let blue1 = randomRGB
            let blue2 = randomRGB
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformColor: {abs($0 - $1)})!
            XCTAssertEqual(abs(red1 - red2), result.toIntRGB.red)
            XCTAssertEqual(abs(green1 - green2), result.toIntRGB.green)
            XCTAssertEqual(abs(blue1 - blue2), result.toIntRGB.blue)
            XCTAssertEqual(alpha1, result.alpha)
        }
        do {
            let red1 = randomRGB
            let red2 = randomRGB
            let green1 = randomRGB
            let green2 = randomRGB
            let blue1 = randomRGB
            let blue2 = randomRGB
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformColor: {_ in rgbMax + 1})
            XCTAssertNil(result)
        }
    }
}

/*
    Double RGB Color
 */
class DoubleRGBColorManipulationOperatorSpec: XCTestCase, ManipulationTestSpec {
    func testOfMap() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map{(r, g, b) in (r / 2, g / 3, b / 4)}!
            XCTAssertEqual(red / 2, result.toDoubleRGB.red)
            XCTAssertEqual(green / 3, result.toDoubleRGB.green)
            XCTAssertEqual(blue / 4, result.toDoubleRGB.blue)
            XCTAssertEqual(alpha, result.alpha)
        }
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map{(r, g, b) in (r, g, percentageMax + 1)}
            XCTAssertNil(result)
        }
    }
    func testOfMapAlpha() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformAlpha:{$0 / 2})!
            XCTAssertEqual(red, result.toDoubleRGB.red)
            XCTAssertEqual(green, result.toDoubleRGB.green)
            XCTAssertEqual(blue, result.toDoubleRGB.blue)
            XCTAssertEqual(alpha / 2, result.alpha)
        }
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformAlpha:{_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
    func testOfMerge() {
        do {
            let red1 = randomPercentage
            let red2 = randomPercentage
            let green1 = randomPercentage
            let green2 = randomPercentage
            let blue1 = randomPercentage
            let blue2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2) { (x: DoubleRGBData, y: DoubleRGBData) in
                let r = abs(x.red - y.red)
                let g = abs(x.green - y.green)
                let b = abs(x.blue - y.blue)
                return (r, g, b)
                }!
            XCTAssertEqual(abs(red1 - red2), result.toDoubleRGB.red)
            XCTAssertEqual(abs(green1 - green2), result.toDoubleRGB.green)
            XCTAssertEqual(abs(blue1 - blue2), result.toDoubleRGB.blue)
            XCTAssertEqual(alpha1, result.alpha)
        }
        do {
            let red1 = randomPercentage
            let red2 = randomPercentage
            let green1 = randomPercentage
            let green2 = randomPercentage
            let blue1 = randomPercentage
            let blue2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2) { (x: DoubleRGBData, y: DoubleRGBData) in
                let r = percentageMax + 1
                let g = abs(x.green - y.green)
                let b = abs(x.blue - y.blue)
                return (r, g, b)
            }
            XCTAssertNil(result)
        }
    }
    func testOfMergeAlpha() {
        do {
            let red1 = randomPercentage
            let red2 = randomPercentage
            let green1 = randomPercentage
            let green2 = randomPercentage
            let blue1 = randomPercentage
            let blue2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformAlpha: {abs($0 - $1)})!
            XCTAssertEqual(red1, result.toDoubleRGB.red)
            XCTAssertEqual(green1, result.toDoubleRGB.green)
            XCTAssertEqual(blue1, result.toDoubleRGB.blue)
            XCTAssertEqual(abs(alpha1 - alpha2), result.alpha)
        }
        do {
            let red1 = randomPercentage
            let red2 = randomPercentage
            let green1 = randomPercentage
            let green2 = randomPercentage
            let blue1 = randomPercentage
            let blue2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformAlpha: {_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
    func testOfWithAlpha() {
        testOfWithAlphaImpl(color: randomDoubleRGBColor)
    }
    
    // rgb color only
    func testOfMapColor() {
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformColor: {$0 / 2})!
            XCTAssertEqual(red / 2, result.toDoubleRGB.red)
            XCTAssertEqual(green / 2, result.toDoubleRGB.green)
            XCTAssertEqual(blue / 2, result.toDoubleRGB.blue)
            XCTAssertEqual(alpha, result.alpha)
        }
        do {
            let red = randomPercentage
            let green = randomPercentage
            let blue = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(red: red, green: green, blue: blue, alpha: alpha)!
            let result = color.map(transformColor:{_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
    
    func testOfMergeColor() {
        do {
            let red1 = randomPercentage
            let red2 = randomPercentage
            let green1 = randomPercentage
            let green2 = randomPercentage
            let blue1 = randomPercentage
            let blue2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformColor: {abs($0 - $1)})!
            XCTAssertEqual(abs(red1 - red2), result.toDoubleRGB.red)
            XCTAssertEqual(abs(green1 - green2), result.toDoubleRGB.green)
            XCTAssertEqual(abs(blue1 - blue2), result.toDoubleRGB.blue)
            XCTAssertEqual(alpha1, result.alpha)
        }
        do {
            let red1 = randomPercentage
            let red2 = randomPercentage
            let green1 = randomPercentage
            let green2 = randomPercentage
            let blue1 = randomPercentage
            let blue2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(red: red1, green: green1, blue: blue1, alpha: alpha1)!
            let color2 = Color.create(red: red2, green: green2, blue: blue2, alpha: alpha2)!
            let result = color1.merge(color2, transformColor: {_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
}

/*
    HSL RGB Color
 */
class HSLColorManipulationOperatorSpec: XCTestCase, ManipulationTestSpec {
    func testOfMap() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            let result = color.map{(h, s, l) in (h.map{$0 / 2}, s / 3, l / 4)}!
            XCTAssertEqual(hue.map{$0 / 2}, result.toHSL.hue)
            XCTAssertEqual(saturation / 3, result.toHSL.saturation)
            XCTAssertEqual(lightness / 4, result.toHSL.lightness)
            XCTAssertEqual(alpha, result.alpha)
        }
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            let result = color.map{(h, s, l) in (h, s, percentageMax + 1)}
            XCTAssertNil(result)
        }
    }
    func testOfMapAlpha() {
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            let result = color.map(transformAlpha:{$0 / 2})!
            XCTAssertEqual(hue, result.toHSL.hue)
            XCTAssertEqual(saturation, result.toHSL.saturation)
            XCTAssertEqual(lightness, result.toHSL.lightness)
            XCTAssertEqual(alpha / 2, result.alpha)
        }
        do {
            let hue = randomDegree
            let saturation = randomPercentage
            let lightness = randomPercentage
            let alpha = randomPercentage
            let color = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)!
            let result = color.map(transformAlpha:{_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
    func testOfMerge() {
        do {
            let hue1 = randomDegree
            let hue2 = randomDegree
            let saturation1 = randomPercentage
            let saturation2 = randomPercentage
            let lightness1 = randomPercentage
            let lightness2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(hue: hue1, saturation: saturation1, lightness: lightness1, alpha: alpha1)!
            let color2 = Color.create(hue: hue2, saturation: saturation2, lightness: lightness2, alpha: alpha2)!
            let result = color1.merge(color2) { (x: HSLData, y: HSLData) in
                let h =  x.hue.flatMap{xh in y.hue.map{yh in xh - yh}}.map(abs)
                let s = abs(x.saturation - y.saturation)
                let l = abs(x.lightness - y.lightness)
                return (h, s, l)
                }!
            XCTAssertEqual(hue1.flatMap{xh in hue2.map{yh in xh - yh}}.map(abs), result.toHSL.hue)
            XCTAssertEqual(abs(saturation1 - saturation2), result.toHSL.saturation)
            XCTAssertEqual(abs(lightness1 - lightness2), result.toHSL.lightness)
            XCTAssertEqual(alpha1, result.alpha)
        }
        do {
            let hue1 = randomDegree
            let hue2 = randomDegree
            let saturation1 = randomPercentage
            let saturation2 = randomPercentage
            let lightness1 = randomPercentage
            let lightness2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(hue: hue1, saturation: saturation1, lightness: lightness1, alpha: alpha1)!
            let color2 = Color.create(hue: hue2, saturation: saturation2, lightness: lightness2, alpha: alpha2)!
            let result = color1.merge(color2) { (x: HSLData, y: HSLData) in
                let h = x.hue.flatMap{xh in y.hue.map{yh in xh - yh}}.map(abs)
                let s = abs(x.saturation - y.saturation)
                let l = percentageMax + 1
                return (h, s, l)
                }
            XCTAssertNil(result)
        }
    }
    func testOfMergeAlpha() {
        do {
            let hue1 = randomDegree
            let hue2 = randomDegree
            let saturation1 = randomPercentage
            let saturation2 = randomPercentage
            let lightness1 = randomPercentage
            let lightness2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(hue: hue1, saturation: saturation1, lightness: lightness1, alpha: alpha1)!
            let color2 = Color.create(hue: hue2, saturation: saturation2, lightness: lightness2, alpha: alpha2)!
            let result = color1.merge(color2, transformAlpha: {abs($0 - $1)})!
            XCTAssertEqual(hue1, result.toHSL.hue)
            XCTAssertEqual(saturation1, result.toHSL.saturation)
            XCTAssertEqual(lightness1, result.toHSL.lightness)
            XCTAssertEqual(abs(alpha1 - alpha2), result.alpha)
        }
        do {
            let hue1 = randomDegree
            let hue2 = randomDegree
            let saturation1 = randomPercentage
            let saturation2 = randomPercentage
            let lightness1 = randomPercentage
            let lightness2 = randomPercentage
            let alpha1 = randomPercentage
            let alpha2 = randomPercentage
            let color1 = Color.create(hue: hue1, saturation: saturation1, lightness: lightness1, alpha: alpha1)!
            let color2 = Color.create(hue: hue2, saturation: saturation2, lightness: lightness2, alpha: alpha2)!
            let result = color1.merge(color2, transformAlpha: {_ in percentageMax + 1})
            XCTAssertNil(result)
        }
    }
    func testOfWithAlpha() {
        testOfWithAlphaImpl(color: randomHSLColor)
    }
}


 
