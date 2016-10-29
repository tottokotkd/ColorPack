//: [Previous](@previous)
import ColorPack
/*:
 ## 6. MANIPULATION
 (Experimental)
 */
let color1 = CSS4Colors.beige
let color2 = CSS4Colors.blueViolet
let r1 = color1.map{(r, g, b) in (r, g, b / 2)}!
r1.toUIColor
let r2 = color1.map(transformAlpha: {$0 / 2})!
r2.toUIColor
let r3 = color1.map(transformColor: {$0 / 2})!
r3.toUIColor
let r4 = color1.merge(color2) {(left, right) in (left.red, right.green, rgbMin)}!
r4.toUIColor
//: [Next](@next)
