//
//  Manipulation.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/26.
//  Copyright © 2016年 tottokotkd. All rights reserved.
//

import Foundation

extension ColorProtocol {
    public func map(_ transform: (T) throws -> T) rethrows -> Self? {
        let newValue = try transform(rawValue)
        return Self(rawValue: newValue, alpha: alpha)
    }
    public func map(transformAlpha: (Percentage) throws -> Percentage) rethrows -> Self? {
        let newAlpha = try transformAlpha(alpha)
        return Self(rawValue: rawValue, alpha: newAlpha)
    }
    public func merge(_ rhs: Self, _ transform: (T, T) throws -> T) rethrows -> Self? {
        let newValue = try transform(rawValue, rhs.rawValue)
        return Self(rawValue: newValue, alpha: alpha)
    }
    public func merge(_ rhs: Self, transformAlpha: (Percentage, Percentage) throws -> Percentage) rethrows -> Self? {
        let newAlpha = try transformAlpha(alpha, rhs.alpha)
        return Self(rawValue: rawValue, alpha: newAlpha)
    }
    public func withAlpha(_ alpha: Percentage) -> Self? {
        return Self(rawValue: rawValue, alpha: alpha)
    }
}
