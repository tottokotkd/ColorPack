import ColorPack
/*:
 # Swift Color Pack
 
 color utility & library of swift
 ## 1. MOTIVATION
 ### Simple Interface
 no more complex conversions.
 */
Color.create(red: 128, green: 128, blue: 255)!
Color.create(hue: 120, saturation: 85.0, lightness: 60.0, alpha: 100.0)!
/*:
 ### Useful Color Preset
 148 colors from CSS4, 48 'crayon' colors, and more
 */
CSS4Colors.rebeccaPurple
CrayonColors.banana
WebSafeColors.x33CC00
JapaneseColors.sakurairo
/*:
 ### Conversion
 specific color properties exist:
 * toInverse
 * toComplementary
 * toAnalogous (upper, lower)
 * toTriad: (upper, lower)
 * toSplitComplementary: (upper, lower)
 */
// 1. convert RGB data to HSL
let color = Color.create(red: 60, green: 195, blue: 130)!.toHSLColor

// 2. convert HSL data to another colors
color.toComplementary

// of course, preset colors provide the same
CSS4Colors.mediumAquaMarine.toUIColor
CSS4Colors.mediumAquaMarine.toHSLColor.toTriad.upper.toUIColor
CSS4Colors.mediumAquaMarine.toHSLColor.toTriad.lower.toUIColor
//: [Next](@next)