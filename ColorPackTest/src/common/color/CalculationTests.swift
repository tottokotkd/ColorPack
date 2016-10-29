//
//  CalculationTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol CalculationTestSpec: TestHelper {
    func testOfAdd()
    func testOfSubtract()
    func testOfMultiply()
    func testOfDivide()
}

/*
    Int RGB Color
 */
class IntRGBColorCalculationTests: XCTestCase, CalculationTestSpec {
    func testOfAdd() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            assertEqualColor(Color.create(red: 104, green: 165, blue: 66)!, value1.add(value2))
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 154, green: 103, blue: 205)!
            assertEqualColor(Color.create(red: 255, green: 255, blue: 255)!, value1.add(value2))
        }
    }
    func testOfSubtract() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            assertEqualColor(Color.create(red: 100, green: 141, blue: 36)!, value1.subtract(value2))
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 154, green: 203, blue: 205)!
            assertEqualColor(Color.create(red: 0, green: 0, blue: 0)!, value1.subtract(value2))
        }
    }
    func testOfMultiply() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 12, blue: 15)!
            assertEqualColor(Color.create(red: 0, green: 7, blue: 3)!, value1.multiply(value2))
        }
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 255, green: 0, blue: 205)!
            assertEqualColor(Color.create(red: 102, green: 0, blue: 41)!, value1.multiply(value2))
        }
    }
    func testOfDivide() {
        do {
            let value1 = Color.create(red: 102, green: 153, blue: 51)!
            let value2 = Color.create(red: 2, green: 0, blue: 255)!
            assertEqualColor(Color.create(red: 51, green: 255, blue: 0)!, value1.divide(value2))
        }
    }
}

/*
    Double RGB Color
 */
class DoubleRGBColorCalculationTests: XCTestCase, CalculationTestSpec {
    func testOfAdd() {
        do {
            let value1 = Color.create(red: 40.0, green: 53.0, blue: 51.0)!
            let value2 = Color.create(red: 2.0, green: 12.0, blue: 15.0)!
            assertEqualColor(Color.create(red: 42.0, green: 65.0, blue: 66.0)!, value1.add(value2))
        }
        do {
            let value1 = Color.create(red: 40.0, green: 53.0, blue: 51.0)!
            let value2 = Color.create(red: 99.0, green: 99.0, blue: 99.0)!
            assertEqualColor(Color.create(red: 100.0, green: 100.0, blue: 100.0)!, value1.add(value2))
        }
    }
    func testOfSubtract() {
        do {
            let value1 = Color.create(red: 40.0, green: 53.0, blue: 51.0)!
            let value2 = Color.create(red: 2.0, green: 12.0, blue: 15.0)!
            assertEqualColor(Color.create(red: 38.0, green: 41.0, blue: 36.0)!, value1.subtract(value2))
        }
        do {
            let value1 = Color.create(red: 40.0, green: 53.0, blue: 51.0)!
            let value2 = Color.create(red: 99.0, green: 99.0, blue: 99.0)!
            assertEqualColor(Color.create(red: 0.0, green: 0.0, blue: 0.0)!, value1.subtract(value2))
        }
    }
    func testOfMultiply() {
        do {
            let value1 = Color.create(red: 20.0, green: 50.0, blue: 30.0)!
            let value2 = Color.create(red: 2.0, green: 1.0, blue: 1.5)!
            assertEqualColor(Color.create(red: 20.0 * 2.0, green: 50.0, blue: 30.0 * 1.5)!, value1.multiply(value2))
        }
        do {
            let value1 = Color.create(red: 2.0, green: 98.0, blue: 51.0)!
            let value2 = Color.create(red: 100.0, green: 0.0, blue: 1.0)!
            assertEqualColor(Color.create(red: 100.0, green: 0, blue: 51.0)!, value1.multiply(value2))
        }
    }
    func testOfDivide() {
        do {
            let value1 = Color.create(red: 98.0, green: 99.0, blue: 75.0)!
            let value2 = Color.create(red: 2.0, green: 0.0, blue: 5.0)!
            assertEqualColor(Color.create(red: 49.0, green: 100.0, blue: 15.0)!, value1.divide(value2))
        }
    }
}
