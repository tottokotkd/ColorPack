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
/*:
 ### Ratio Merge
 useful with array of Percentage
 */
let start = JapaneseColors.midori.toHSLColor
let end = start.toSplitComplementary.lower
let colors = Array(stride(from: 0, through: 100, by: 20.0)).lazy.map{ratio in start.merge(end, ratio: ratio)}
colors[0].toUIColor
colors[1].toUIColor
colors[2].toUIColor
colors[3].toUIColor
colors[4].toUIColor
colors[5].toUIColor
//: [Next](@next)
