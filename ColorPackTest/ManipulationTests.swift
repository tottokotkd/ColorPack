//
//  ManipulationTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/26.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

class ManipulationTests: XCTestCase {
    func testOfMapMethod() {
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.map(transformColor: {$0 + 51})!
            XCTAssertEqual(102, result.intRGB.red)
            XCTAssertEqual(153, result.intRGB.green)
            XCTAssertEqual(204, result.intRGB.blue)
            XCTAssertEqual(0.6, result.alpha)
        }
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.map(transformColor: {$0 + 151})
            XCTAssertNil(result)
        }
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.map(transformAlpha: {$0 + 0.1})!
            XCTAssertEqual(51, result.intRGB.red)
            XCTAssertEqual(102, result.intRGB.green)
            XCTAssertEqual(153, result.intRGB.blue)
            XCTAssertEqual(0.7, result.alpha)
        }
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.map(transformAlpha: {$0 + 151})
            XCTAssertNil(result)
        }
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.map{(r, g, b, a) in (r + 10, g + 20, b + 30, a + 0.1)}!
            XCTAssertEqual(61, result.intRGB.red)
            XCTAssertEqual(122, result.intRGB.green)
            XCTAssertEqual(183, result.intRGB.blue)
            XCTAssertEqual(0.7, result.alpha)
        }
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.map{(r, g, b, a) in (r + 10, g + 20, b + 30, a + 1.0)}
            XCTAssertNil(result)
        }
    }
    func testOfMergeMethod() {
        do {
            let color1 = Color.create(hex: 0x339966, alpha: 0.6)!
            let color2 = Color.create(hex: 0x333399, alpha: 0.6)!
            let result = color1.merge(color2, transformColor: {$0 + $1 - 1})!
            XCTAssertEqual(101, result.intRGB.red)
            XCTAssertEqual(203, result.intRGB.green)
            XCTAssertEqual(254, result.intRGB.blue)
            XCTAssertEqual(0.6, result.alpha)
        }
        do {
            let color1 = Color.create(hex: 0x339966, alpha: 0.6)!
            let color2 = Color.create(hex: 0x333399, alpha: 0.6)!
            let result = color1.merge(color2, transformColor: {$0 + $1 - 1000})
            XCTAssertNil(result)
        }
        do {
            let color1 = Color.create(hex: 0x339966, alpha: 0.6)!
            let color2 = Color.create(hex: 0x333399, alpha: 0.6)!
            let result = color1.merge(color2, transformAlpha: {$0 + $1 - 0.3})!
            XCTAssertEqual(51, result.intRGB.red)
            XCTAssertEqual(153, result.intRGB.green)
            XCTAssertEqual(102, result.intRGB.blue)
            XCTAssertEqual(0.6 + 0.6 - 0.3, result.alpha)
        }
        do {
            let color1 = Color.create(hex: 0x339966, alpha: 0.6)!
            let color2 = Color.create(hex: 0x333399, alpha: 0.6)!
            let result = color1.merge(color2, transformAlpha: {$0 + $1 - 1000})
            XCTAssertNil(result)
        }
        do {
            let color1 = Color.create(hex: 0x339966, alpha: 0.6)!
            let color2 = Color.create(hex: 0x333399, alpha: 0.6)!
            let result = color1.merge(color2,{(l, r) in (r.0 + l.0, r.1 + l.1, r.2 + l.2, r.3 + l.3 - 0.3)})!
            XCTAssertEqual(102, result.intRGB.red)
            XCTAssertEqual(204, result.intRGB.green)
            XCTAssertEqual(255, result.intRGB.blue)
            XCTAssertEqual(0.6 + 0.6 - 0.3, result.alpha)
        }
        do {
            let color1 = Color.create(hex: 0x339966, alpha: 0.6)!
            let color2 = Color.create(hex: 0x333399, alpha: 0.6)!
            let result = color1.merge(color2,{(l, r) in (r.0 + l.0, r.1 + l.1, r.2 + l.2, r.3 + l.3)})
            XCTAssertNil(result)
        }
    }
    func testOfWithAlphaMethod() {
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.withAlpha(0.9)!
            XCTAssertEqual(51, result.intRGB.red)
            XCTAssertEqual(102, result.intRGB.green)
            XCTAssertEqual(153, result.intRGB.blue)
            XCTAssertEqual(0.9, result.alpha)
        }
        do {
            let color = Color.create(hex: 0x336699, alpha: 0.6)!
            let result = color.withAlpha(1.9)
            XCTAssertNil(result)
        }
    }
}
