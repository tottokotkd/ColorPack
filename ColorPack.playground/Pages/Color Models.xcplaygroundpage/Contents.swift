//: [Previous](@previous)
import ColorPack
/*:
 ## 2. COLOR MODELS
 ColorPack implements three color models; Int RGB, Percentage RGB and HSL.
 
 Every model has `alpha` value, from 0% to 100%. Not 0.0 to 1.0!
 
 ### (1) Int RGB
 Specified by Int values, from 0 to 255.
 */
IntRGBColor(rawValue: (red: 0, green: 128, blue: 255), alpha: 100)
/*:
 ### (2) Percentage RGB
 Specified by percentage values, from 0% to 100%.
 */
DoubleRGBColor(rawValue: (red: 0, green: 50, blue: 100), alpha: 100)
/*:
 ### (3) HSL
 Hue: Specified by degrees or nil (automatically changed to between 0 and 360)
 Saturation, Lightness: Specified by percentage values, from 0% to 100%.
 */
HSLColor(rawValue: (hue: -150, saturation: 100, lightness: 50), alpha: 100)
//: [Next](@next)
