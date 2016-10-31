//: [Previous](@previous)
import ColorPack
/*:
 ## 4. CONVERSION
 now only HSL Color data provides these conversions.
 */
// example
let color = JapaneseColors.杏色.toHSLColor
color.toUIColor
/*:
 ### (1) Inverse Color
 */
color.toUIColor
color.toInverse.toUIColor
/*:
 ### (2) Complementary Color
 */
color.toUIColor
color.toComplementary.toUIColor
/*:
 ### (3) Analogous Colors
 */
color.toUIColor
color.toAnalogous.upper.toUIColor
color.toAnalogous.lower.toUIColor
/*:
 ### (4) Triad Colors
 */
color.toUIColor
color.toTriadic.upper.toUIColor
color.toTriadic.lower.toUIColor
/*:
 ### (5) Split Complementary Colors
 */
color.toUIColor
color.toSplitComplementary.upper.toUIColor
color.toSplitComplementary.lower.toUIColor
//: [Next](@next)
