//
//  FactoryTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/26.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol ColorFactoryTestSpec: TestHelper {
    func testOfDecimalRGBFactory()
    func testOfHexRGBFactory()
    func testOfWebSafeFactory()
}

class FactoryTests: XCTestCase, ColorFactoryTestSpec {
    func testOfDecimalRGBFactory() {
        do {
            let color = Color.rgb(red: .d102, green: .d51, blue: .d255)
            let expected = Color.create(red: 102, green: 51, blue: 255)!
            assertEqualColor(expected, color)
        }
    }
    func testOfHexRGBFactory() {
        do {
            let color = Color.hex(red: .x66, green: .x33, blue: .xFF)
            let expected = Color.create(red: 102, green: 51, blue: 255)!
            assertEqualColor(expected, color)
        }
    }
    func testOfWebSafeFactory() {
        do {
            let color = Color.webSafe(red: .k0, green: .kC, blue: .kF)
            let expected = Color.create(red: 0, green: 204, blue: 255)!
            assertEqualColor(expected, color)
        }
    }
}
