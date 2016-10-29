//: [Previous](@previous)
import ColorPack
/*:
 ## 3. DATA CREATION
 Users can choice better one from some approaches to create a color data.
 
 ### (1) Struct Initializer
 CAUTION: Their initializers are failable, so users are liable to keep all parameters correct
 */
// success pattern
IntRGBColor(red: 0, green: 128, blue: 255, alpha: 100)!
IntRGBColor(hex: 0x0088FF, alpha: 100)!
DoubleRGBColor(red: 0, green: 50, blue: 100, alpha: 100)!
HSLColor(hue: -150, saturation: 100, lightness: 50, alpha: 100)!

// failure pattern
IntRGBColor(red: -10, green: 0, blue: 0, alpha: 0)
IntRGBColor(hex: 0x1234567, alpha: 0)
DoubleRGBColor(red: 105, green: 0, blue: 0, alpha: 0)
HSLColor(hue: 0, saturation: 0, lightness: 0, alpha: 999999)
/*:
 ### (2) Color.create method (recommended)
 `Color` object offers convenient method to create a color data. Default alpha value is 100%.
 
 CAUTION: These are just wrappers of struct initializers, so are failable.
 */
Color.create(red: 0, green: 128, blue: 255, alpha: 100)!
Color.create(hex: 0x0088FF, alpha: 100)!
Color.create(red: 0.0, green: 50.0, blue: 100.0, alpha: 100)!
Color.create(hue: -150, saturation: 100, lightness: 50, alpha: 100)!

// using default alpha value
Color.create(red: 0, green: 128, blue: 255)!
Color.create(hex: 0x0088FF)!
Color.create(red: 0.0, green: 50.0, blue: 100.0)!
Color.create(hue: 0, saturation: 0, lightness: 0)!
/*:
 ### (3) Color.truncate method
 These methods round down invalid values to acceptable values. Even users mistake values, never `nil` returned.
 */
Color.truncate(red: -10, green: 0, blue: 0, alpha: 0)
Color.truncate(hex: 0x1234567, alpha: 0)
Color.truncate(red: 105, green: 0, blue: 0, alpha: 0)
Color.truncate(hue: 0, saturation: 0, lightness: 0, alpha: 999999)
/*:
 ### (4) Factory Methods (Int RGB Only)
 They require enum parameters and always return non optional value.
 */
Color.rgb(red: .d0, green: .d153, blue: .d255)
Color.hex(red: .x00, green: .x99, blue: .xFF)
Color.webSafe(red: .k0, green: .k9, blue: .kF)
//: [Next](@next)
