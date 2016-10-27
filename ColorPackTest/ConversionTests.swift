//
//  ColorPackTest.swift
//  ColorPackTest
//
//  Created by Shusuke Tokuda on 2016/10/23.
//  Copyright © 2016 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

class ColorPackTest: XCTestCase {
    func testOfDoubleConvertor() {
        do {
            let color = Color.create(hex: 0xFFFFFF)!.toDoubleRGB
            XCTAssertEqual(1, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0xCCFFFF)!.toDoubleRGB
            XCTAssertEqual(0.8, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x99FFFF)!.toDoubleRGB
            XCTAssertEqual(0.6, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x66FFFF)!.toDoubleRGB
            XCTAssertEqual(0.4, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x33FFFF)!.toDoubleRGB
            XCTAssertEqual(0.2, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x00FFFF)!.toDoubleRGB
            XCTAssertEqual(0, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        
    }
    func testOfFloatConvertor() {
        do {
            let color = Color.create(hex: 0xFFFFFF)!.toFloatRGB
            XCTAssertEqual(1, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0xCCFFFF)!.toFloatRGB
            XCTAssertEqual(0.8, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x99FFFF)!.toFloatRGB
            XCTAssertEqual(0.6, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x66FFFF)!.toFloatRGB
            XCTAssertEqual(0.4, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x33FFFF)!.toFloatRGB
            XCTAssertEqual(0.2, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color.create(hex: 0x00FFFF)!.toFloatRGB
            XCTAssertEqual(0, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
    }
    func testOfHexStringConvertor() {
        let value = 0x1289FC
        let color = Color.create(hex: value)!
        XCTAssertEqual("1289FC", color.toHexString)
    }
    func testOfIntRGBColorDescription() {
        let value = 0xCC9933
        let color = Color.create(hex: value)!
        XCTAssertEqual("IntRGBColor #CC9933 <red: 204, green: 153, blue: 51, alpha: 1.0>", color.description)
    }
    func testOfDoubleRGBColorDescription() {
        let color = Color.create(red: 0.8, green: 0.6, blue: 0.2)!
        XCTAssertEqual("DoubleRGBColor <red: 0.8, green: 0.6, blue: 0.2, alpha: 1.0>", color.description)
    }
}
