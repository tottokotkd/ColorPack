# Swift Color Pack

swift color utility

## get 

### manual
click `clone or download` 

### Carthage (recommended)

1. add ColorPack to `Cartfile`

    ```
    github "tottokotkd/ColorPack" "1.1"
    ```

2. `carthage update`

## use

```swift
import ColorPack

// init? (RGB)
// Int
Color.create(red: 100, green: 200, blue: 50)?.toUIColor
Color.create(red: 100, green: 200, blue: 50, alpha: 0.3)?.toUIColor
Color.create(red: 100, green: 200, blue: 350)?.toUIColor
Color.create(red: 100, green: 200, blue: 50, alpha: 1.3)?.toUIColor

// Double
Color.create(red: 0.94, green: 0.38, blue: 0.13)?.toUIColor
Color.create(red: 1 / 3.0, green: 4 / 5.0, blue: 8 / 9.0, alpha: 0.3)?.toUIColor
Color.create(red: 0.94, green: 0.38, blue: 2)?.toUIColor
Color.create(red: 0.94, green: 0.38, blue: 0.13, alpha: 1.1)?.toUIColor

// init? (Hex)
Color.create(hex: 0xFFcc44)?.toUIColor
Color.create(hex: 0xFFcc44, alpha: 0.6)?.toUIColor

// factory (type safe: RGB, Hex, Web safe)
Color.rgb(red: .d0, green: .d100, blue: .d180).toUIColor
Color.hex(red: .x77, green: .x22, blue: .x99).toUIColor
Color.webSafe(red: .k9, green: .kC, blue: .kF).toUIColor

// useful library
// CSS4: 148 colors
CSS4Colors.beige.toUIColor
CSS4Colors.dimGray.toUIColor
CSS4Colors.rebeccaPurple.toUIColor

// web safe colors: 216
WebSafeColors.x0000CC.toUIColor
WebSafeColors.x00CC33.toUIColor
WebSafeColors.xFF0099.toUIColor

// 'crayon' set: 48
CrayonColors.aluminum.toUIColor
CrayonColors.banana.toUIColor
CrayonColors.flora.toUIColor

// japanese colors: roughly 700
JapaneseColors.ao.toUIColor
JapaneseColors.藍.toUIColor
JapaneseColors.sabionando.toUIColor
JapaneseColors.錆御納戸.toUIColor
```

### screenshot
![playgroupnd](doc/p1.png)

## License
MIT

## version
### v 1.0 -> 1.1
* RGB can be specified with Double values
* 'Color' struct is removed: `Color.init?()` is changed to `Color.create()`
* factory methods renamed: , `Color.RGB`, `.Hex` and `.WebSafe` are changed to `.rgb`, `.hex`, `.webSafe`
