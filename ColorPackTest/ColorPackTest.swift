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
    
    func testOfRGBInitializers() {
        do {
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0))
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 255))
            XCTAssertNotNil(Color.create(red: 0, green: 255, blue: 0))
            XCTAssertNotNil(Color.create(red: 0, green: 255, blue: 255))
            XCTAssertNotNil(Color.create(red: 255, green: 0, blue: 0))
            XCTAssertNotNil(Color.create(red: 255, green: 0, blue: 255))
            XCTAssertNotNil(Color.create(red: 255, green: 255, blue: 0))
            XCTAssertNotNil(Color.create(red: 255, green: 255, blue: 255))
            XCTAssertNotNil(Color.create(red: -0, green: -0, blue: -0))
            
            XCTAssertNil(Color.create(red: -1, green: 0, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: -1, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: 0, blue: -1))
            XCTAssertNil(Color.create(red: 256, green: 0, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: 256, blue: 0))
            XCTAssertNil(Color.create(red: 0, green: 0, blue: 256))
            
        }
        do {
            XCTAssertNotNil(Color.create(red: 0.0, green: 0.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 0.0, green: 0.0, blue: 1.0))
            XCTAssertNotNil(Color.create(red: 0.0, green: 1.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 0.0, green: 1.0, blue: 1.0))
            XCTAssertNotNil(Color.create(red: 1.0, green: 0.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 1.0, green: 0.0, blue: 1.0))
            XCTAssertNotNil(Color.create(red: 1.0, green: 1.0, blue: 0.0))
            XCTAssertNotNil(Color.create(red: 1.0, green: 1.0, blue: 1.0))
            XCTAssertNotNil(Color.create(red: -0.0, green: -0.0, blue: -0.0))
            
            XCTAssertNil(Color.create(red: -1, green: 0.0, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: -1, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: -1))
            XCTAssertNil(Color.create(red: 1.1, green: 0.0, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 1.1, blue: 0.0))
            XCTAssertNil(Color.create(red: 0.0, green: 0.0, blue: 1.1))
            
        }
        do {
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0, alpha: 0))
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0, alpha: 1.0))
            XCTAssertNotNil(Color.create(red: 0, green: 0, blue: 0, alpha: -0.0))
            
            XCTAssertNil(Color.create(red: 0, green: 0, blue: 0, alpha: -0.1))
            XCTAssertNil(Color.create(red: 0, green: 0, blue: 0, alpha: 1.1))
        }
        do {
            let color = Color.create(red: 51, green: 153, blue: 255)!
            XCTAssertEqual(51, color.intRGB.red)
            XCTAssertEqual(153, color.intRGB.green)
            XCTAssertEqual(255, color.intRGB.blue)
            XCTAssertEqual(0.2, color.toFloatRGB.red)
            XCTAssertEqual(0.6, color.toFloatRGB.green)
            XCTAssertEqual(1, color.toFloatRGB.blue)
            XCTAssertEqual(0.2, color.toDoubleRGB.red)
            XCTAssertEqual(0.6, color.toDoubleRGB.green)
            XCTAssertEqual(1, color.toDoubleRGB.blue)        }
        do {
            let color = Color.create(red: 0.2, green: 0.6, blue: 1)!
            XCTAssertEqual(51, color.intRGB.red)
            XCTAssertEqual(153, color.intRGB.green)
            XCTAssertEqual(255, color.intRGB.blue)
            XCTAssertEqual(0.2, color.toFloatRGB.red)
            XCTAssertEqual(0.6, color.toFloatRGB.green)
            XCTAssertEqual(1, color.toFloatRGB.blue)
            XCTAssertEqual(0.2, color.toDoubleRGB.red)
            XCTAssertEqual(0.6, color.toDoubleRGB.green)
            XCTAssertEqual(1, color.toDoubleRGB.blue)
        }
    }
    func testOfHexInitializers() {
        do {
            XCTAssertNotNil(Color.create(hex: 0x000000))
            XCTAssertNotNil(Color.create(hex: 0xFFFFFF))
            XCTAssertNotNil(Color.create(hex: -0x000000))
            
            XCTAssertNil(Color.create(hex: -0x000001))
            XCTAssertNil(Color.create(hex: 0xFFFFFF + 1))
        }
        do {
            XCTAssertNotNil(Color.create(hex: 0x000000, alpha: 0))
            XCTAssertNotNil(Color.create(hex: 0xFFFFFF, alpha: 1.0))
            XCTAssertNotNil(Color.create(hex: 0x000000, alpha: -0))
            
            XCTAssertNil(Color.create(hex: -0x000001, alpha: -0.1))
            XCTAssertNil(Color.create(hex: 0xFFFFFF, alpha: 1.1))
        }
        do {
            XCTAssertNotNil(Color.create(hex: Int("FFFFFF", radix: 16)!))
        }
        do {
            let color = Color.create(hex: 0xFFCC99)!
            XCTAssertEqual(255, color.intRGB.red)
            XCTAssertEqual(204, color.intRGB.green)
            XCTAssertEqual(153, color.intRGB.blue)
        }
    }
    func testOfWebSafeInitializers() {
        do {
            let color = Color.webSafe(red: .k0, green: .kC, blue: .kF)
            XCTAssertEqual(0, color.intRGB.red)
            XCTAssertEqual(204, color.intRGB.green)
            XCTAssertEqual(255, color.intRGB.blue)
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
}
