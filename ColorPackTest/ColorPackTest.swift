//
//  ColorPackTest.swift
//  ColorPackTest
//
//  Created by Shusuke Tokuda on 2016/10/23.
//  Copyright © 2016 tottokotkd. All rights reserved.
//

import XCTest
@testable import ColorPack

class ColorPackTest: XCTestCase {
    
    func testOfRGBInitializers() {
        do {
            XCTAssertNotNil(Color(red: 0, green: 0, blue: 0))
            XCTAssertNotNil(Color(red: 0, green: 0, blue: 255))
            XCTAssertNotNil(Color(red: 0, green: 255, blue: 0))
            XCTAssertNotNil(Color(red: 0, green: 255, blue: 255))
            XCTAssertNotNil(Color(red: 255, green: 0, blue: 0))
            XCTAssertNotNil(Color(red: 255, green: 0, blue: 255))
            XCTAssertNotNil(Color(red: 255, green: 255, blue: 0))
            XCTAssertNotNil(Color(red: 255, green: 255, blue: 255))
            XCTAssertNotNil(Color(red: -0, green: -0, blue: -0))
            
            XCTAssertNil(Color(red: -1, green: 0, blue: 0))
            XCTAssertNil(Color(red: 0, green: -1, blue: 0))
            XCTAssertNil(Color(red: 0, green: 0, blue: -1))
            XCTAssertNil(Color(red: 256, green: 0, blue: 0))
            XCTAssertNil(Color(red: 0, green: 256, blue: 0))
            XCTAssertNil(Color(red: 0, green: 0, blue: 256))
            
        }
        do {
            XCTAssertNotNil(Color(red: 0, green: 0, blue: 0, alpha: 0))
            XCTAssertNotNil(Color(red: 0, green: 0, blue: 0, alpha: 1.0))
            XCTAssertNotNil(Color(red: 0, green: 0, blue: 0, alpha: -0.0))
            
            XCTAssertNil(Color(red: 0, green: 0, blue: 0, alpha: -0.1))
            XCTAssertNil(Color(red: 0, green: 0, blue: 0, alpha: 1.1))
        }
        do {
            let color = Color(red: 120, green: 220, blue: 40)!
            XCTAssertEqual(120, color.red)
            XCTAssertEqual(220, color.green)
            XCTAssertEqual(40, color.blue)
        }
    }
    func testOfHexInitializers() {
        do {
            XCTAssertNotNil(Color(hex: 0x000000))
            XCTAssertNotNil(Color(hex: 0xFFFFFF))
            XCTAssertNotNil(Color(hex: -0x000000))
            
            XCTAssertNil(Color(hex: -0x000001))
            XCTAssertNil(Color(hex: 0xFFFFFF + 1))
        }
        do {
            XCTAssertNotNil(Color(hex: 0x000000, alpha: 0))
            XCTAssertNotNil(Color(hex: 0xFFFFFF, alpha: 1.0))
            XCTAssertNotNil(Color(hex: 0x000000, alpha: -0))
            
            XCTAssertNil(Color(hex: -0x000001, alpha: -0.1))
            XCTAssertNil(Color(hex: 0xFFFFFF, alpha: 1.1))
        }
        do {
            XCTAssertNotNil(Color(hex: Int("FFFFFF", radix: 16)!))
        }
        do {
            let color = Color(hex: 0xFFCC99)!
            XCTAssertEqual(255, color.red)
            XCTAssertEqual(204, color.green)
            XCTAssertEqual(153, color.blue)
        }
    }
    func testOfWebSafeInitializers() {
        do {
            let color = Color.WebSafe(red: .k0, green: .kC, blue: .kF)
            XCTAssertEqual(0, color.red)
            XCTAssertEqual(204, color.green)
            XCTAssertEqual(255, color.blue)
        }
    }
    
    func testOfFloatConvertor() {
        do {
            let color = Color(hex: 0xFFFFFF)!.toFloat
            XCTAssertEqual(1, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color(hex: 0xCCFFFF)!.toFloat
            XCTAssertEqual(0.8, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color(hex: 0x99FFFF)!.toFloat
            XCTAssertEqual(0.6, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color(hex: 0x66FFFF)!.toFloat
            XCTAssertEqual(0.4, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color(hex: 0x33FFFF)!.toFloat
            XCTAssertEqual(0.2, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        do {
            let color = Color(hex: 0x00FFFF)!.toFloat
            XCTAssertEqual(0, color.red)
            XCTAssertEqual(1, color.green)
            XCTAssertEqual(1, color.blue)
        }
        
    }
}
