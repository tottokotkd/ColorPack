//
//  ColorCalcTest.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

class CalculationMethodTests: XCTestCase {
    
    func testOfFuncAdd() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            let result = value1.add(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(104, red)
            XCTAssertEqual(165, green)
            XCTAssertEqual(66, blue)
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 154, green: 103, blue: 205)!
            let result = value1.add(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(255, red)
            XCTAssertEqual(255, green)
            XCTAssertEqual(255, blue)
        }
    }
    func testOfFuncSubtract() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            let result = value1.subtract(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(100, red)
            XCTAssertEqual(141, green)
            XCTAssertEqual(36, blue)
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 154, green: 203, blue: 205)!
            let result = value1.subtract(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(0, red)
            XCTAssertEqual(0, green)
            XCTAssertEqual(0, blue)
        }
    }
    
    func testOfFuncMultiply() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            let result = value1.multiply(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(0, red)
            XCTAssertEqual(7, green)
            XCTAssertEqual(3, blue)
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 255, green: 0, blue: 205)!
            let result = value1.multiply(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(102, red)
            XCTAssertEqual(0, green)
            XCTAssertEqual(41, blue)
        }
    }
    func testOfFuncDivide() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 0, blue: 255)!
            let result = value1.divide(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(255, red)
            XCTAssertEqual(255, green)
            XCTAssertEqual(51, blue)
        }
    }
    
    func testOfPropToComplement() {
        do {
            let value = Color.create(red: 102, green: 153, blue: 51)!
            let result = value.toComplement
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(102, red)
            XCTAssertEqual(51, green)
            XCTAssertEqual(153, blue)
        }
        do {
            let value = Color.create(red: 102, green: 153, blue: 51)!
            let result = value.toComplement.toComplement
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(102, red)
            XCTAssertEqual(153, green)
            XCTAssertEqual(51, blue)
        }
    }
    func testOfPropToInvert() {
        do {
            let value = Color.create(red: 100, green: 25, blue: 190)!
            let result = value.toInverse
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(155, red)
            XCTAssertEqual(230, green)
            XCTAssertEqual(65, blue)
        }
        do {
            let value = Color.create(red: 100, green: 25, blue: 190)!
            let result = value.toInverse.toInverse
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(100, red)
            XCTAssertEqual(25, green)
            XCTAssertEqual(190, blue)
        }
    }
    
}


class OperatorsTests: XCTestCase {
    
    func testOfOperatorAdd() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            let result = value1  + value2
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(104, red)
            XCTAssertEqual(165, green)
            XCTAssertEqual(66, blue)
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 154, green: 103, blue: 205)!
            let result = value1 + value2
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(255, red)
            XCTAssertEqual(255, green)
            XCTAssertEqual(255, blue)
        }
    }
    func testOfOperatorSubtract() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            let result = value1 - value2
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(100, red)
            XCTAssertEqual(141, green)
            XCTAssertEqual(36, blue)
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 154, green: 203, blue: 205)!
            let result = value1 - value2
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(0, red)
            XCTAssertEqual(0, green)
            XCTAssertEqual(0, blue)
        }
    }
    
    func testOfOperatorMultiply() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            let result = value1 * value2
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(0, red)
            XCTAssertEqual(7, green)
            XCTAssertEqual(3, blue)
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 255, green: 0, blue: 205)!
            let result = value1 * value2
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(102, red)
            XCTAssertEqual(0, green)
            XCTAssertEqual(41, blue)
        }
    }
    func testOfOperatorDivide() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 0, blue: 255)!
            let result = value1.divide(value2)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(255, red)
            XCTAssertEqual(255, green)
            XCTAssertEqual(51, blue)
        }
    }
    func testOfOperatorToComplement() {
        do {
            let value = Color.create(red: 102, green: 153, blue: 51)!
            let result = !value
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(102, red)
            XCTAssertEqual(51, green)
            XCTAssertEqual(153, blue)
        }
        do {
            let value = Color.create(red: 102, green: 153, blue: 51)!
            let result = !(!value)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(102, red)
            XCTAssertEqual(153, green)
            XCTAssertEqual(51, blue)
        }
    }
    func testOfOperatorToInvert() {
        do {
            let value = Color.create(red: 100, green: 25, blue: 190)!
            let result = ~value
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(155, red)
            XCTAssertEqual(230, green)
            XCTAssertEqual(65, blue)
        }
        do {
            let value = Color.create(red: 100, green: 25, blue: 190)!
            let result = ~(~value)
            let (red, green, blue) = result.intRGB
            XCTAssertEqual(100, red)
            XCTAssertEqual(25, green)
            XCTAssertEqual(190, blue)
        }
    }
}
