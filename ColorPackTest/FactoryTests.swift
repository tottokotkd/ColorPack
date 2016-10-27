//
//  FactoryTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/26.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

class FactoryTests: XCTestCase {
    
    func testOfDecimalRGBFactory() {
        do {
            let color = Color.rgb(red: .d102, green: .d51, blue: .d255)
            XCTAssertEqual(102, color.toIntRGB.red)
            XCTAssertEqual(51, color.toIntRGB.green)
            XCTAssertEqual(255, color.toIntRGB.blue)
        }
    }
    func testOfHexRGBFactory() {
        do {
            let color = Color.hex(red: .x66, green: .x33, blue: .xFF)
            XCTAssertEqual(102, color.toIntRGB.red)
            XCTAssertEqual(51, color.toIntRGB.green)
            XCTAssertEqual(255, color.toIntRGB.blue)        }
    }
    func testOfWebSafeFactory() {
        do {
            let color = Color.webSafe(red: .k0, green: .kC, blue: .kF)
            XCTAssertEqual(0, color.toIntRGB.red)
            XCTAssertEqual(204, color.toIntRGB.green)
            XCTAssertEqual(255, color.toIntRGB.blue)
        }
    }
}
