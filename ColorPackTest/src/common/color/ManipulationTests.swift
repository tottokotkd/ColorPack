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
    func testOfMergeWithRatio()
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
            
            let expected = Color.create(red: red / 2, green: green / 3, blue: blue / 4, alpha: alpha)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: red, green: green, blue: blue, alpha: alpha / 2)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: abs(red1 - red2),
                                        green: abs(green1 - green2),
                                        blue: abs(blue1 - blue2),
                                        alpha: alpha1)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: red1, green: green1, blue: blue1, alpha: abs(alpha1 - alpha2))!
            XCTAssertEqual(expected, result)
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
    func testOfMergeWithRatio() {
        let color1 = Color.create(red: 100, green: 200, blue: 250)!
        let color2 = Color.create(red: 200, green: 250, blue: 50)!
        let ratio = 40.0
        let result = color1.merge(color2, ratio: ratio)
        let expected = Color.create(red: 140, green: 220, blue: 170)
        XCTAssertEqual(result, expected)
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
            
            let expected = Color.create(red: red / 2, green: green / 2, blue: blue / 2, alpha: alpha)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: abs(red1 - red2),
                                        green: abs(green1 - green2),
                                        blue: abs(blue1 - blue2),
                                        alpha: alpha1)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: red / 2, green: green / 3, blue: blue / 4, alpha: alpha)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: red, green: green, blue: blue, alpha: alpha / 2)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: abs(red1 - red2),
                                        green: abs(green1 - green2),
                                        blue: abs(blue1 - blue2),
                                        alpha: alpha1)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: red1, green: green1, blue: blue1, alpha: abs(alpha1 - alpha2))!
            XCTAssertEqual(expected, result)
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
    func testOfMergeWithRatio() {
        let color1 = Color.create(red: 20.0, green: 80.0, blue: 100.0)!
        let color2 = Color.create(red: 80.0, green: 100.0, blue: 20.0)!
        let ratio = 40.0
        let result = color1.merge(color2, ratio: ratio)
        let expected = Color.create(red: 44.0, green: 88.0, blue: 68.0)
        XCTAssertEqual(result, expected)
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
            
            let expected = Color.create(red: red / 2, green: green / 2, blue: blue / 2, alpha: alpha)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(red: abs(red1 - red2),
                                        green: abs(green1 - green2),
                                        blue: abs(blue1 - blue2),
                                        alpha: alpha1)!
            XCTAssertEqual(expected, result)
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
    HSL Color
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
            
            let expected = Color.create(hue: hue.map{$0 / 2}, saturation: saturation / 3, lightness: lightness / 4, alpha: alpha)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha / 2)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(hue: hue1.flatMap{xh in hue2.map{yh in xh - yh}}.map(abs),
                                        saturation: abs(saturation1 - saturation2),
                                        lightness: abs(lightness1 - lightness2),
                                        alpha: alpha1)!
            XCTAssertEqual(expected, result)
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
            
            let expected = Color.create(hue: hue1, saturation: saturation1, lightness: lightness1, alpha: abs(alpha1 - alpha2))!
            XCTAssertEqual(expected, result)
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
    func testOfMergeWithRatio() {
        do {
            let color1 = Color.create(hue: 30, saturation: 70, lightness: 60)!
            let color2 = Color.create(hue: 10, saturation: 90, lightness: 30)!
            let ratio = 40.0
            let result = color1.merge(color2, ratio: ratio)
            let expected = Color.create(hue: 22, saturation: 78, lightness: 48)!
            XCTAssertEqual(result, expected)
        }
        do {
            let color1 = Color.create(hue: 30, saturation: 70, lightness: 60)!
            let color2 = Color.create(hue: 30, saturation: 90, lightness: 30)!
            let ratio = 40.0
            let result = color1.merge(color2, ratio: ratio)
            let expected = Color.create(hue: 30, saturation: 78, lightness: 48)!
            XCTAssertEqual(result, expected)
        }
        do {
            let color1 = Color.create(hue: 30, saturation: 70, lightness: 60)!
            let color2 = Color.create(hue: 130, saturation: 90, lightness: 30)!
            let ratio = 40.0
            let result = color1.merge(color2, ratio: ratio)
            let expected = Color.create(hue: 70, saturation: 78, lightness: 48)!
            XCTAssertEqual(result, expected)
        }
        do {
            let color1 = Color.create(hue: 30, saturation: 70, lightness: 60)!
            let color2 = Color.create(hue: 230, saturation: 90, lightness: 30)!
            let ratio = 40.0
            let result = color1.merge(color2, ratio: ratio)
            let expected = Color.create(hue: 326, saturation: 78, lightness: 48)!
            XCTAssertEqual(result, expected)
        }
        do {
            let color1 = Color.create(hue: 330, saturation: 70, lightness: 60)!
            let color2 = Color.create(hue: 30, saturation: 90, lightness: 30)!
            let ratio = 40.0
            let result = color1.merge(color2, ratio: ratio)
            let expected = Color.create(hue: 354, saturation: 78, lightness: 48)!
            XCTAssertEqual(result, expected)
        }
        do {
            let color1 = Color.create(hue: 330, saturation: 70, lightness: 60)!
            let color2 = Color.create(hue: 130, saturation: 90, lightness: 30)!
            let ratio = 40.0
            let result = color1.merge(color2, ratio: ratio)
            let expected = Color.create(hue: 34, saturation: 78, lightness: 48)!
            XCTAssertEqual(result, expected)
        }
        do {
            let color1 = Color.create(hue: 330, saturation: 70, lightness: 60)!
            let color2 = Color.create(hue: 230, saturation: 90, lightness: 30)!
            let ratio = 40.0
            let result = color1.merge(color2, ratio: ratio)
            let expected = Color.create(hue: 290, saturation: 78, lightness: 48)!
            XCTAssertEqual(result, expected)
        }
    }
    func testOfWithAlpha() {
        testOfWithAlphaImpl(color: randomHSLColor)
    }
}
