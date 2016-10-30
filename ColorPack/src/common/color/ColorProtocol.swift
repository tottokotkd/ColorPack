//
//  Protocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

public protocol ColorDataContainerProtocol {
    // conversion
    var toIntRGBData: IntRGBData {get}
    var toDoubleRGBData: DoubleRGBData {get}
    var toHSLData: HSLData {get}
    var toHexString: String {get}
}

public protocol ColorProtocol: ColorDataContainerProtocol, Equatable {
    associatedtype T
    var rawValue: T {get}
    var alpha: Percentage {get}
    
    init?(rawValue: T, alpha: Double)
}

public protocol ColorCalculationProtocol: ColorProtocol {
    func add(_ rhs: Self) -> Self
    func subtract(_ rhs: Self) -> Self
    func multiply(_ rhs: Self) -> Self
    func divide(_ rhs: Self) -> Self
//    func screen(_ rhs: ColorProtocol) -> ColorProtocol
//    func overlay(_ rhs: ColorProtocol) -> ColorProtocol
//    func dodge(_ rhs: ColorProtocol) -> ColorProtocol
//    func burn(_ rhs: ColorProtocol) -> ColorProtocol
//    func hardLight(_ rhs: ColorProtocol) -> ColorProtocol
//    func softLight(_ rhs: ColorProtocol) -> ColorProtocol
//    func grainExtract(_ rhs: ColorProtocol) -> ColorProtocol
//    func grainMerge(_ rhs: ColorProtocol) -> ColorProtocol
//    func difference(_ rhs: ColorProtocol) -> ColorProtocol
//    func darkenOnly(_ rhs: ColorProtocol) -> ColorProtocol
//    func lightenOnly(_ rhs: ColorProtocol) -> ColorProtocol
}

public protocol ColorManipulationProtocol: ColorProtocol {
    func map(_ transform: (T) throws -> T) rethrows -> Self?
    func map(transformAlpha: (Percentage) throws -> Percentage) rethrows -> Self?
    func merge(_ rhs: Self, _ transform: (T, T) throws -> T) rethrows -> Self?
    func merge(_ rhs: Self, ratio: Percentage) -> Self
    func merge(_ rhs: Self, transformAlpha: (Percentage, Percentage) throws -> Percentage) rethrows -> Self?
    func withAlpha(_ alpha: Percentage) -> Self?
}

public protocol ColorConversionProtocol: ColorProtocol {
    var toInverse: Self {get}
    var toComplementary: Self {get}
    var toAnalogous: (upper: Self, lower: Self) {get}
    var toTriad: (upper: Self, lower: Self) {get}
    var toSplitComplementary: (upper: Self, lower: Self) {get}
}

public protocol IntRGBColorProtocol: ColorProtocol, ColorCalculationProtocol, ColorManipulationProtocol {
    var rawValue: (red: RGB, green: RGB, blue: RGB) {get}
    func map(transformColor: (RGB) throws -> RGB) rethrows -> Self?
    func merge(_ rhs: Self, transformColor: (RGB, RGB) throws -> RGB) rethrows -> Self?
}

protocol DoubleRGBColorProtocol: ColorProtocol, ColorCalculationProtocol, ColorManipulationProtocol {
    var rawValue: (red: Percentage, green: Percentage, blue: Percentage) {get}
    func map(transformColor: (Percentage) throws -> Percentage) rethrows -> Self?
    func merge(_ rhs: Self, transformColor: (Percentage, Percentage) throws -> Percentage) rethrows -> Self?
}

protocol HSLColorProtocol: ColorProtocol, ColorManipulationProtocol, ColorConversionProtocol {
    var rawValue: (hue: Degree?, saturation: Percentage, lightness: Percentage) {get}
}
