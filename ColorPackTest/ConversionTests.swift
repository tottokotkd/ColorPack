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
            XCTAssertEqual(100, color.red)
            XCTAssertEqual(100, color.green)
            XCTAssertEqual(100, color.blue)
        }
        do {
            let color = Color.create(hex: 0xCCFFFF)!.toDoubleRGB
            XCTAssertEqual(80, color.red)
            XCTAssertEqual(100, color.green)
            XCTAssertEqual(100, color.blue)
        }
        do {
            let color = Color.create(hex: 0x99FFFF)!.toDoubleRGB
            XCTAssertEqual(60, color.red)
            XCTAssertEqual(100, color.green)
            XCTAssertEqual(100, color.blue)
        }
        do {
            let color = Color.create(hex: 0x66FFFF)!.toDoubleRGB
            XCTAssertEqual(40, color.red)
            XCTAssertEqual(100, color.green)
            XCTAssertEqual(100, color.blue)
        }
        do {
            let color = Color.create(hex: 0x33FFFF)!.toDoubleRGB
            XCTAssertEqual(20, color.red)
            XCTAssertEqual(100, color.green)
            XCTAssertEqual(100, color.blue)
        }
        do {
            let color = Color.create(hex: 0x00FFFF)!.toDoubleRGB
            XCTAssertEqual(0, color.red)
            XCTAssertEqual(100, color.green)
            XCTAssertEqual(100, color.blue)
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
        XCTAssertEqual("IntRGBColor #CC9933 <red: 204, green: 153, blue: 51, alpha: 100.0%>", color.description)
    }
    func testOfDoubleRGBColorDescription() {
        let color = Color.create(red: 80.0, green: 60.0, blue: 20.0)!
        XCTAssertEqual("DoubleRGBColor <red: 80.0%, green: 60.0%, blue: 20.0%, alpha: 100.0%>", color.description)
    }
}
