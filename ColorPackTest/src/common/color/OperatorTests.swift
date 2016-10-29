//
//  OperatorTests.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/28.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import XCTest
import ColorPack

protocol CalculationOperatorTestSpec: TestHelper {
    func testOfPlusOperator()
    func testOfMinusOperator()
    func testOfMultiplyOperator()
    func testOfDivideOperator()
}
protocol ManipulationOperatorTestSpec: TestHelper {
    func testOfMultiplyOperator()
    func testOfDivideOperator()
}

protocol ColorSchemeOperatorTestSpec: TestHelper {
    func testOfLogicalNotOperator()
    func testOfBitwiseNotOperator()
}

extension ManipulationOperatorTestSpec {
    func testOfMultiplyOperatorImpl<C: ColorManipulationProtocol>(color: C) {
        do {
            let result = color * 0
            assertEqualColor(color, result)
            assertEqualAlpha(0, result)
        }
        do {
            let result = color * 0.1
            assertEqualColor(color, result)
            assertEqualAlpha(color.alpha * 0.1, result)
        }
        do {
            let result = color * 1
            assertEqualColor(color, result)
            assertEqualAlpha(color.alpha * 1, result)
        }
        do {
            let result = color * (percentageMax * 2  / color.alpha)
            assertEqualColor(color, result)
            assertEqualAlpha(percentageMax, result)
        }
        do {
            let result = color * -1
            assertEqualColor(color, result)
            assertEqualAlpha(0, result)
        }
    }
    func testOfDivideOperatorImpl<C: ColorManipulationProtocol>(color: C){
        do {
            let result = color / 0.0
            assertEqualColor(color, result)
            assertEqualAlpha(percentageMax, result)
        }
        do {
            let result = color / 10
            assertEqualColor(color, result)
            assertEqualAlpha(color.alpha / 10, result)
        }
        do {
            let result = color / 1
            assertEqualColor(color, result)
            assertEqualAlpha(color.alpha / 1, result)
        }
        do {
            let result = color / -1
            assertEqualColor(color, result)
            assertEqualAlpha(0, result)
        }
        
    }
}

/*
    Int RGB color
 */
class IntColorCalculationOperatorTests: XCTestCase, CalculationOperatorTestSpec {
    func testOfPlusOperator() {
        do {
            let value1 = randomIntRGBColor
            let value2 = randomIntRGBColor
            assertEqualColor(value1.add(value2), value1 + value2)
        }
    }
    func testOfMinusOperator() {
        do {
            let value1 = randomIntRGBColor
            let value2 = randomIntRGBColor
            assertEqualColor(value1.subtract(value2), value1 - value2)
        }
    }
    func testOfMultiplyOperator() {
        do {
            let value1 = randomIntRGBColor
            let value2 = randomIntRGBColor
            assertEqualColor(value1.multiply(value2), value1 * value2)
        }
    }
    func testOfDivideOperator() {
        do {
            let value1 = randomIntRGBColor
            let value2 = randomIntRGBColor
            assertEqualColor(value1.divide(value2), value1 / value2)
        }
    }
}
class IntColorManipulationOperatorTests: XCTestCase, ManipulationOperatorTestSpec {
    func testOfMultiplyOperator() {
        testOfMultiplyOperatorImpl(color: randomIntRGBColor)
    }
    func testOfDivideOperator() {
        testOfDivideOperatorImpl(color: randomIntRGBColor)
    }
}

/*
    Double RGB Color
 */
class DoubleRGBColorCalculationOperatorTestSpec: XCTestCase, CalculationOperatorTestSpec {
    func testOfPlusOperator() {
        do {
            let value1 = randomDoubleRGBColor
            let value2 = randomDoubleRGBColor
            assertEqualColor(value1.add(value2), value1 + value2)
        }
    }
    func testOfMinusOperator() {
        do {
            let value1 = randomDoubleRGBColor
            let value2 = randomDoubleRGBColor
            assertEqualColor(value1.subtract(value2), value1 - value2)
        }
    }
    func testOfMultiplyOperator() {
        do {
            let value1 = randomDoubleRGBColor
            let value2 = randomDoubleRGBColor
            assertEqualColor(value1.multiply(value2), value1 * value2)
        }
    }
    func testOfDivideOperator() {
        do {
            let value1 = randomDoubleRGBColor
            let value2 = randomDoubleRGBColor
            assertEqualColor(value1.divide(value2), value1 / value2)
        }
    }
}
class DoubleRGBColorManipulationOperatorTestSpec: XCTestCase, ManipulationOperatorTestSpec {
    func testOfMultiplyOperator() {
        testOfMultiplyOperatorImpl(color: randomDoubleRGBColor)
    }
    func testOfDivideOperator() {
        testOfDivideOperatorImpl(color: randomDoubleRGBColor)
    }
}

/*
    HSL Color
 */
class HSLColorManipulationOperatorTestSpec: XCTestCase, ManipulationOperatorTestSpec {
    func testOfMultiplyOperator() {
        testOfMultiplyOperatorImpl(color: randomHSLColor)
    }
    func testOfDivideOperator() {
        testOfDivideOperatorImpl(color: randomHSLColor)
    }
}
class HSLColorColorSchemeOperatorTestSpec: XCTestCase, ColorSchemeOperatorTestSpec {
    func testOfLogicalNotOperator() {
        do {
            let color = randomHSLColor
            let result = !color
            assertEqualColor(color.toComplementary, result)
        }
    }
    func testOfBitwiseNotOperator() {
        let color = randomHSLColor
        let result = ~color
        assertEqualColor(color.toInverse, result)
    }
}
