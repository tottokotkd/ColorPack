//: [Previous](@previous)
import ColorPack
/*:
 ## 7. OPERATORS
 (Experimental)
 */
// example
let color1 = CSS4Colors.bisque
color1.toUIColor
let color2 = CSS4Colors.darkSlateGray
color2.toUIColor
/*:
 ### (1) Calculation Operator
 */
(color1 + color2).toUIColor
(color1 - color2).toUIColor
(color1 * color2).toUIColor
(color1 / color2).toUIColor
/*:
 ### (2) Manipulation Operator
 */
(color1 / 5).toUIColor
((color1 / 4) * 2).toUIColor
/*:
 ### (3) Conversion Operator
 */
(!color1.toHSLColor).toUIColor
(~color1.toHSLColor).toUIColor
