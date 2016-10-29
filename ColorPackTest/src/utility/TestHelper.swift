//
//  TestHelper.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol TestHelper {
    func assertEqualColor<C: ColorProtocol>(_ a: C, _ b: C)
    func assertEqualRGB(_ a: (RGB, RGB, RGB), _ b: (RGB, RGB, RGB))
    func assertEqualPercentageRGB(_ a: (Percentage, Percentage, Percentage), _ b: (Percentage, Percentage, Percentage))
    func assertEqualHSL(_ a: (Degree?, Percentage, Percentage), _ b: (Degree?, Percentage, Percentage))
    func assertEqualAlpha<C: ColorProtocol>(_ a: Percentage, _ b: C)
    var randomRGB: RGB {get}
    var randomPercentage: Percentage {get}
    var randomDegree: Degree? {get}
    var randomIntRGBColor: IntRGBColor {get}
    var randomDoubleRGBColor: DoubleRGBColor {get}
    var randomHSLColor: HSLColor {get}
}
extension TestHelper {
    func assertEqualColor<C: ColorProtocol>(_ a: C, _ b: C) {
        assertEqualRGB(a.toIntRGB, b.toIntRGB)
        assertEqualPercentageRGB(a.toDoubleRGB, b.toDoubleRGB)
        assertEqualHSL(a.toHSL, b.toHSL)
    }
    func assertEqualRGB(_ a: (RGB, RGB, RGB), _ b: (RGB, RGB, RGB)) {
        XCTAssertEqual(a.0, b.0)
        XCTAssertEqual(a.1, b.1)
        XCTAssertEqual(a.2, b.2)
    }
    func assertEqualPercentageRGB(_ a: (Percentage, Percentage, Percentage), _ b: (Percentage, Percentage, Percentage)) {
        XCTAssertEqual(a.0, b.0)
        XCTAssertEqual(a.1, b.1)
        XCTAssertEqual(a.2, b.2)
    }
    func assertEqualHSL(_ a: (Degree?, Percentage, Percentage), _ b: (Degree?, Percentage, Percentage)) {
        XCTAssertEqual(a.0, b.0)
        XCTAssertEqual(a.1, b.1)
        XCTAssertEqual(a.2, b.2)
    }
    func assertEqualAlpha<C: ColorProtocol>(_ a: Percentage, _ b: C) {
        XCTAssertEqual(a, b.alpha)
    }
    var randomRGB: RGB {return RGB(arc4random_uniform(0xFF))}
    var randomPercentage: Percentage {return Double(arc4random_uniform(100000)) / Double(100000)}
    var randomDegree: Degree? {
        let v =  Double(360 * arc4random_uniform(100000)) / Double(100000)
        return v == 1.0 ? nil : v
    }
    
    var randomIntRGBColor: IntRGBColor {
        return Color.create(red: randomRGB, green: randomRGB, blue: randomRGB, alpha: randomPercentage)!
    }
    var randomDoubleRGBColor: DoubleRGBColor {
        return Color.create(red: randomPercentage, green: randomPercentage, blue: randomPercentage, alpha: randomPercentage)!
    }
    var randomHSLColor: HSLColor {
        return Color.create(hue: randomDegree, saturation: randomPercentage, lightness: randomPercentage, alpha: randomPercentage)!
    }
}
