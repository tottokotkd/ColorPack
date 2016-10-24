import ColorPack

// init? (RGB)
Color(red: 100, green: 200, blue: 50)?.toUIColor
Color(red: 100, green: 200, blue: 50, alpha: 0.3)?.toUIColor
Color(red: 100, green: 200, blue: 350)?.toUIColor
Color(red: 100, green: 200, blue: 50, alpha: 1.3)?.toUIColor

// init? (Hex)
Color(hex: 0xFFcc44)?.toUIColor
Color(hex: 0xFFcc44, alpha: 0.6)?.toUIColor

// init (type safe: RGB, Hex, Web safe)
Color.RGB(red: .d0, green: .d100, blue: .d180).toUIColor
Color.Hex(red: .x77, green: .x22, blue: .x99).toUIColor
Color.WebSafe(red: .k9, green: .kC, blue: .kF).toUIColor

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

