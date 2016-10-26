//
//  Manipulation.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/26.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorProtocol {
    public func map(transformColor: (Int) throws -> Int) rethrows -> ColorProtocol? {
        let (r, g, b) = intRGB
        let red = try transformColor(r)
        let green = try transformColor(g)
        let blue = try transformColor(b)
        return Self.create(red: red, green: green, blue: blue, alpha: alpha)
    }
    public func map(transformAlpha: (Double) throws -> Double) rethrows -> ColorProtocol? {
        let (red, green, blue) = intRGB
        let newAlpha = try transformAlpha(alpha)
        return Self.create(red: red, green: green, blue: blue, alpha: newAlpha)
    }
    public func map(_ transform: (RGBa) throws -> RGBa) rethrows -> ColorProtocol? {
        let (r, g, b) = intRGB
        let (red, green, blue, newAlpha) = try transform(r, g, b, alpha)
        return Self.create(red: red, green: green, blue: blue, alpha: newAlpha)
    }
    public func merge(_ rhs: ColorProtocol, transformColor: (Int, Int) throws -> Int) rethrows -> ColorProtocol? {
        let (r1, g1, b1) = intRGB
        let (r2, g2, b2) = rhs.intRGB
        let red = try transformColor(r1, r2)
        let green = try transformColor(g1, g2)
        let blue = try transformColor(b1, b2)
        return Self.create(red: red, green: green, blue: blue, alpha: alpha)
    }
    public func merge(_ rhs: ColorProtocol, transformAlpha: (Double, Double) throws -> Double) rethrows -> ColorProtocol? {
        let (red, green, blue) = intRGB
        let newAlpha = try transformAlpha(alpha, rhs.alpha)
        return Self.create(red: red, green: green, blue: blue, alpha: newAlpha)
    }
    public func merge(_ rhs: ColorProtocol, _ transform: (RGBa, RGBa) throws -> RGBa) rethrows -> ColorProtocol? {
        let (r1, g1, b1) = intRGB
        let (r2, g2, b2) = rhs.intRGB
        let (red, green, blue, newAlpha) = try transform((r1, g1, b1, alpha), (r2, g2, b2, rhs.alpha))
        return Self.create(red: red, green: green, blue: blue, alpha: newAlpha)
    }
    public func withAlpha(_ alpha: Double) -> ColorProtocol? {
        let (r, g, b) = intRGB
        return Color.create(red: r, green: g, blue: b, alpha: alpha)
    }
}
