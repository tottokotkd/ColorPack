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

// init (type safe: RGB, Hex, Web safe)
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

(JapaneseColors.藍 + JapaneseColors.錆御納戸).toUIColor
(JapaneseColors.藍 - JapaneseColors.錆御納戸).toUIColor
(JapaneseColors.藍 * JapaneseColors.錆御納戸).toUIColor
(JapaneseColors.藍 / JapaneseColors.錆御納戸).toUIColor

(JapaneseColors.藍 * JapaneseColors.錆御納戸 - (JapaneseColors.藍 - JapaneseColors.錆御納戸)).toUIColor

JapaneseColors.錆御納戸.toUIColor
(JapaneseColors.藍 / 2).toUIColor
(JapaneseColors.藍 / 3).toUIColor
(JapaneseColors.藍 / 4).toUIColor
(JapaneseColors.藍 / 5).toUIColor

JapaneseColors.錆御納戸.toUIColor
JapaneseColors.錆御納戸.toComplement.toUIColor
JapaneseColors.錆御納戸.toInverse.toUIColor
