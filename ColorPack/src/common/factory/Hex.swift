//
//  HexColor.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/23.
//
//

import Foundation

extension ColorFactory {
    public static func hex(red: HexKey, green: HexKey, blue: HexKey) -> IntRGBColor {
        return Self.create(red: red.rawValue, green: green.rawValue, blue: blue.rawValue)!
    }
    public static func hex(keys: HexKeys) -> IntRGBColor {
        return Self.create(red: keys.red.rawValue, green: keys.green.rawValue, blue: keys.blue.rawValue)!
    }
}

public struct HexKeys {
    let red: HexKey
    let green: HexKey
    let blue: HexKey
    init(_ r: HexKey, _ g: HexKey, _ b: HexKey) {
        red = r
        green = g
        blue = b
    }
}

public enum HexKey: RGB {
    case x00 = 0
    case x01 = 1
    case x02 = 2
    case x03 = 3
    case x04 = 4
    case x05 = 5
    case x06 = 6
    case x07 = 7
    case x08 = 8
    case x09 = 9
    case x0A = 10
    case x0B = 11
    case x0C = 12
    case x0D = 13
    case x0E = 14
    case x0F = 15
    case x10 = 16
    case x11 = 17
    case x12 = 18
    case x13 = 19
    case x14 = 20
    case x15 = 21
    case x16 = 22
    case x17 = 23
    case x18 = 24
    case x19 = 25
    case x1A = 26
    case x1B = 27
    case x1C = 28
    case x1D = 29
    case x1E = 30
    case x1F = 31
    case x20 = 32
    case x21 = 33
    case x22 = 34
    case x23 = 35
    case x24 = 36
    case x25 = 37
    case x26 = 38
    case x27 = 39
    case x28 = 40
    case x29 = 41
    case x2A = 42
    case x2B = 43
    case x2C = 44
    case x2D = 45
    case x2E = 46
    case x2F = 47
    case x30 = 48
    case x31 = 49
    case x32 = 50
    case x33 = 51
    case x34 = 52
    case x35 = 53
    case x36 = 54
    case x37 = 55
    case x38 = 56
    case x39 = 57
    case x3A = 58
    case x3B = 59
    case x3C = 60
    case x3D = 61
    case x3E = 62
    case x3F = 63
    case x40 = 64
    case x41 = 65
    case x42 = 66
    case x43 = 67
    case x44 = 68
    case x45 = 69
    case x46 = 70
    case x47 = 71
    case x48 = 72
    case x49 = 73
    case x4A = 74
    case x4B = 75
    case x4C = 76
    case x4D = 77
    case x4E = 78
    case x4F = 79
    case x50 = 80
    case x51 = 81
    case x52 = 82
    case x53 = 83
    case x54 = 84
    case x55 = 85
    case x56 = 86
    case x57 = 87
    case x58 = 88
    case x59 = 89
    case x5A = 90
    case x5B = 91
    case x5C = 92
    case x5D = 93
    case x5E = 94
    case x5F = 95
    case x60 = 96
    case x61 = 97
    case x62 = 98
    case x63 = 99
    case x64 = 100
    case x65 = 101
    case x66 = 102
    case x67 = 103
    case x68 = 104
    case x69 = 105
    case x6A = 106
    case x6B = 107
    case x6C = 108
    case x6D = 109
    case x6E = 110
    case x6F = 111
    case x70 = 112
    case x71 = 113
    case x72 = 114
    case x73 = 115
    case x74 = 116
    case x75 = 117
    case x76 = 118
    case x77 = 119
    case x78 = 120
    case x79 = 121
    case x7A = 122
    case x7B = 123
    case x7C = 124
    case x7D = 125
    case x7E = 126
    case x7F = 127
    case x80 = 128
    case x81 = 129
    case x82 = 130
    case x83 = 131
    case x84 = 132
    case x85 = 133
    case x86 = 134
    case x87 = 135
    case x88 = 136
    case x89 = 137
    case x8A = 138
    case x8B = 139
    case x8C = 140
    case x8D = 141
    case x8E = 142
    case x8F = 143
    case x90 = 144
    case x91 = 145
    case x92 = 146
    case x93 = 147
    case x94 = 148
    case x95 = 149
    case x96 = 150
    case x97 = 151
    case x98 = 152
    case x99 = 153
    case x9A = 154
    case x9B = 155
    case x9C = 156
    case x9D = 157
    case x9E = 158
    case x9F = 159
    case xA0 = 160
    case xA1 = 161
    case xA2 = 162
    case xA3 = 163
    case xA4 = 164
    case xA5 = 165
    case xA6 = 166
    case xA7 = 167
    case xA8 = 168
    case xA9 = 169
    case xAA = 170
    case xAB = 171
    case xAC = 172
    case xAD = 173
    case xAE = 174
    case xAF = 175
    case xB0 = 176
    case xB1 = 177
    case xB2 = 178
    case xB3 = 179
    case xB4 = 180
    case xB5 = 181
    case xB6 = 182
    case xB7 = 183
    case xB8 = 184
    case xB9 = 185
    case xBA = 186
    case xBB = 187
    case xBC = 188
    case xBD = 189
    case xBE = 190
    case xBF = 191
    case xC0 = 192
    case xC1 = 193
    case xC2 = 194
    case xC3 = 195
    case xC4 = 196
    case xC5 = 197
    case xC6 = 198
    case xC7 = 199
    case xC8 = 200
    case xC9 = 201
    case xCA = 202
    case xCB = 203
    case xCC = 204
    case xCD = 205
    case xCE = 206
    case xCF = 207
    case xD0 = 208
    case xD1 = 209
    case xD2 = 210
    case xD3 = 211
    case xD4 = 212
    case xD5 = 213
    case xD6 = 214
    case xD7 = 215
    case xD8 = 216
    case xD9 = 217
    case xDA = 218
    case xDB = 219
    case xDC = 220
    case xDD = 221
    case xDE = 222
    case xDF = 223
    case xE0 = 224
    case xE1 = 225
    case xE2 = 226
    case xE3 = 227
    case xE4 = 228
    case xE5 = 229
    case xE6 = 230
    case xE7 = 231
    case xE8 = 232
    case xE9 = 233
    case xEA = 234
    case xEB = 235
    case xEC = 236
    case xED = 237
    case xEE = 238
    case xEF = 239
    case xF0 = 240
    case xF1 = 241
    case xF2 = 242
    case xF3 = 243
    case xF4 = 244
    case xF5 = 245
    case xF6 = 246
    case xF7 = 247
    case xF8 = 248
    case xF9 = 249
    case xFA = 250
    case xFB = 251
    case xFC = 252
    case xFD = 253
    case xFE = 254
    case xFF = 255
}
