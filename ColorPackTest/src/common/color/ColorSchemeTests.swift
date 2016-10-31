//
//  ColorSchemeTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol ColorSchemeTestSpec: TestHelper {
    func testOfPropToInverse()
    func testOfPropToComplementary()
    func testOfPropToAnalogous()
    func testOfPropToTriad()
    func testOfPropToSplitComplementary()
}

/*
    HSL Color
 */
class HSLColorSchemeTestSpec: XCTestCase, ColorSchemeTestSpec {
    func testOfPropToInverse() {
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let expected = Color.create(hue: 300, saturation: 30, lightness: 35)!
            let result = value.toInverse
            assertEqualColor(expected, result)
        }
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let result = value.toInverse.toInverse
            assertEqualColor(value, result)
        }
    }
    func testOfPropToComplementary() {
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let expected = Color.create(hue: 300, saturation: 30, lightness: 65)!
            let result = value.toComplementary
            assertEqualColor(expected, result)
        }
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let result = value.toComplementary.toComplementary
            assertEqualColor(value, result)
        }
    }
    func testOfPropToAnalogous() {
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let expected1 = Color.create(hue: 150, saturation: 30, lightness: 65)!
            let expected2 = Color.create(hue: 90, saturation: 30, lightness: 65)!
            let result = value.toAnalogous
            assertEqualColor(expected1, result.upper)
            assertEqualColor(expected2, result.lower)
        }
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let result1 = value.toAnalogous.upper.toAnalogous.lower
            let result2 = value.toAnalogous.lower.toAnalogous.upper
            assertEqualColor(value, result1)
            assertEqualColor(value, result2)
        }
    }
    func testOfPropToTriad() {
        do { 
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let expected1 = Color.create(hue: 240, saturation: 30, lightness: 65)!
            let expected2 = Color.create(hue: 0, saturation: 30, lightness: 65)!
            let result = value.toTriadic
            assertEqualColor(expected1, result.upper)
            assertEqualColor(expected2, result.lower)
        }
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let result1 = value.toTriadic.upper.toTriadic.lower
            let result2 = value.toTriadic.lower.toTriadic.upper
            let result3 = value.toTriadic.upper.toTriadic.upper.toTriadic.upper
            let result4 = value.toTriadic.lower.toTriadic.lower.toTriadic.lower
            assertEqualColor(value, result1)
            XCTAssertEqual(value, result2)
            assertEqualColor(value, result3)
            assertEqualColor(value, result4)
        }
    }
    func testOfPropToSplitComplementary() {
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let expected1 = Color.create(hue: 330, saturation: 30, lightness: 65)!
            let expected2 = Color.create(hue: 270, saturation: 30, lightness: 65)!
            let result = value.toSplitComplementary
            assertEqualColor(expected1, result.upper)
            assertEqualColor(expected2, result.lower)
        }
        do {
            let value = Color.create(hue: 120, saturation: 30, lightness: 65)!
            let result1 = value.toComplementary.toAnalogous
            let result2 = value.toSplitComplementary
            assertEqualColor(result1.upper, result2.upper)
            assertEqualColor(result1.lower, result2.lower)
        }
    }
}

