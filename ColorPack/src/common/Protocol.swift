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
    static func rgb(red: RGB, green: RGB, blue: RGB) -> IntRGBColor
    static func hex(red: Hex, green: Hex, blue: Hex) -> IntRGBColor
    static func hex(keys: HexKeys) -> IntRGBColor
}

public protocol ColorProtocol: ColorFactory, CustomStringConvertible {
    associatedtype T
    var rawValue: T {get}
    var alpha: Double {get}
    
    init?(rawValue: T, alpha: Double)
    
    var toIntRGB: (red: Int, green: Int, blue: Int) {get}
    var toFloatRGB: (red: Float, green: Float, blue: Float) {get}
    var toDoubleRGB: (red: Double, green: Double, blue: Double) {get}
    var toHexString: String {get}
    
    func map(_ transform: (T) throws -> T) rethrows -> Self?
    func map(transformAlpha: (Double) throws -> Double) rethrows -> Self?
    func merge(_ rhs: Self, _ transform: (T, T) throws -> T) rethrows -> Self?
    func merge(_ rhs: Self, transformAlpha: (Double, Double) throws -> Double) rethrows -> Self?
    func withAlpha(_ alpha: Double) -> Self?
    
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
    var rawValue: (red: Int, green: Int, blue: Int) {get}
    
    func map(transformColor: (Int) throws -> Int) rethrows -> Self?
    func merge(_ rhs: Self, transformColor: (Int, Int) throws -> Int) rethrows -> Self?
}

protocol DoubleRGBColorProtocol: ColorProtocol {
    var rawValue: (red: Double, green: Double, blue: Double) {get}
    
    func map(transformColor: (Double) throws -> Double) rethrows -> Self?
    func merge(_ rhs: Self, transformColor: (Double, Double) throws -> Double) rethrows -> Self?
}
