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

public protocol ColorInitializer {
    static func create(red: Int, green: Int, blue: Int, alpha: Double) -> ColorProtocol?
    static func create(hex: Int, alpha: Double) -> ColorProtocol?
    static func create(red: Double, green: Double, blue: Double, alpha: Double) -> ColorProtocol?
    static func truncate(red: Int, green: Int, blue: Int, alpha: Double) -> ColorProtocol
    static func truncate(hex: Int, alpha: Double) -> ColorProtocol
    static func truncate(red: Double, green: Double, blue: Double, alpha: Double) -> ColorProtocol
    static func truncateColorValue(_ value: Double) -> Double
    static func truncateColorValue(_ value: Int) -> Int
    static func truncateAlphaValue(_ value: Double) -> Double
}

public protocol ColorFactory: ColorInitializer {
    static func webSafe(red: WebSafeColorKey, green: WebSafeColorKey, blue: WebSafeColorKey) -> ColorProtocol
    static func rgb(red: RGB, green: RGB, blue: RGB) -> ColorProtocol
    static func hex(red: Hex, green: Hex, blue: Hex) -> ColorProtocol
    static func hex(keys: HexKeys) -> ColorProtocol
}

public protocol ColorProtocol: ColorFactory, CustomStringConvertible {
    var intRGB: (red: Int, green: Int, blue: Int) {get}
    var alpha: Double {get}
    
    var toFloatRGB: (red: Float, green: Float, blue: Float) {get}
    var toDoubleRGB: (red: Double, green: Double, blue: Double) {get}
    var toHexString: String {get}
    
    typealias RGBa = (Int, Int, Int, Double)
    func map(transformColor: (Int) throws -> Int) rethrows -> ColorProtocol?
    func map(transformAlpha: (Double) throws -> Double) rethrows -> ColorProtocol?
    func map(_ transform: (RGBa) throws -> RGBa) rethrows -> ColorProtocol?
    func merge(_ rhs: ColorProtocol, transformColor: (Int, Int) throws -> Int) rethrows -> ColorProtocol?
    func merge(_ rhs: ColorProtocol, transformAlpha: (Double, Double) throws -> Double) rethrows -> ColorProtocol?
    func merge(_ rhs: ColorProtocol, _ transform: (RGBa, RGBa) throws -> RGBa) rethrows -> ColorProtocol?
    func withAlpha(_ alpha: Double) -> ColorProtocol?
    
    func add(_ rhs: ColorProtocol) -> ColorProtocol
    func subtract(_ rhs: ColorProtocol) -> ColorProtocol
    func multiply(_ rhs: ColorProtocol) -> ColorProtocol
    func divide(_ rhs: ColorProtocol) -> ColorProtocol
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
    var toInverse: ColorProtocol {get}
    var toComplement: ColorProtocol {get}
}
