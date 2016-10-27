//
//  Protocol.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/25.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

public struct Color: ColorFactory {
}

public protocol ColorFactory: IntRGBColorInitializer, DoubleRGBColorInitializer {
    static func webSafe(red: WebSafeColorKey, green: WebSafeColorKey, blue: WebSafeColorKey) -> IntRGBColor
    static func rgb(red: RGBKey, green: RGBKey, blue: RGBKey) -> IntRGBColor
    static func hex(red: HexKey, green: HexKey, blue: HexKey) -> IntRGBColor
    static func hex(keys: HexKeys) -> IntRGBColor
}

public protocol ColorProtocol: ColorFactory, CustomStringConvertible {
    associatedtype T
    var rawValue: T {get}
    var alpha: Percentage {get}
    
    init?(rawValue: T, alpha: Double)
    
    var toIntRGB: (red: RGB, green: RGB, blue: RGB) {get}
    var toDoubleRGB: (red: Percentage, green: Percentage, blue: Percentage) {get}
    var toHexString: String {get}
    
    func map(_ transform: (T) throws -> T) rethrows -> Self?
    func map(transformAlpha: (Percentage) throws -> Percentage) rethrows -> Self?
    func merge(_ rhs: Self, _ transform: (T, T) throws -> T) rethrows -> Self?
    func merge(_ rhs: Self, transformAlpha: (Percentage, Percentage) throws -> Percentage) rethrows -> Self?
    func withAlpha(_ alpha: Percentage) -> Self?
    
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
    
    var toInverse: Self {get}
    var toComplement: Self {get}
}

public protocol IntRGBColorProtocol: ColorProtocol {
    var rawValue: (red: RGB, green: RGB, blue: RGB) {get}
    func map(transformColor: (RGB) throws -> RGB) rethrows -> Self?
    func merge(_ rhs: Self, transformColor: (RGB, RGB) throws -> RGB) rethrows -> Self?
}

protocol DoubleRGBColorProtocol: ColorProtocol {
    var rawValue: (red: Percentage, green: Percentage, blue: Percentage) {get}
    func map(transformColor: (Percentage) throws -> Percentage) rethrows -> Self?
    func merge(_ rhs: Self, transformColor: (Percentage, Percentage) throws -> Percentage) rethrows -> Self?
}
}
