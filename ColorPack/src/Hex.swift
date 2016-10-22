//
//  HexColor.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/23.
//
//

import Foundation

extension Color {
    public init(red: Hex, green: Hex, blue: Hex) {
        self.init(red: red.rawValue, green: green.rawValue, blue: blue.rawValue)
    }
}

public enum Hex: Int {
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

extension Hex {
    static var cF4B3C2: Color {return Color(red: .xF4, green: .xB3, blue: .xC2)}
    static var cD4ACAD: Color {return Color(red: .xD4, green: .xAC, blue: .xAD)}
    static var cE1A9AB: Color {return Color(red: .xE1, green: .xA9, blue: .xAB)}
    static var cF6BFBC: Color {return Color(red: .xF6, green: .xBF, blue: .xBC)}
    static var cF5B1AA: Color {return Color(red: .xF5, green: .xB1, blue: .xAA)}
    static var cE4AB9B: Color {return Color(red: .xE4, green: .xAB, blue: .x9B)}
    static var cF09199: Color {return Color(red: .xF0, green: .x91, blue: .x99)}
    static var cF2A0A1: Color {return Color(red: .xF2, green: .xA0, blue: .xA1)}
    static var cF0908D: Color {return Color(red: .xF0, green: .x90, blue: .x8D)}
    static var cE9546B: Color {return Color(red: .xE9, green: .x54, blue: .x6B)}
    static var cE95464: Color {return Color(red: .xE9, green: .x54, blue: .x64)}
    static var cEC6D71: Color {return Color(red: .xEC, green: .x6D, blue: .x71)}
    static var cEE827C: Color {return Color(red: .xEE, green: .x82, blue: .x7C)}
    static var cDF7163: Color {return Color(red: .xDF, green: .x71, blue: .x63)}
    static var cEE836F: Color {return Color(red: .xEE, green: .x83, blue: .x6F)}
    static var cD57C6B: Color {return Color(red: .xD5, green: .x7C, blue: .x6B)}
    static var cEC6D51: Color {return Color(red: .xEC, green: .x6D, blue: .x51)}
    static var cD0826C: Color {return Color(red: .xD0, green: .x82, blue: .x6C)}
    static var cF19072: Color {return Color(red: .xF1, green: .x90, blue: .x72)}
    static var cFF5234: Color {return Color(red: .xFF, green: .x52, blue: .x34)}
    static var cFB3C02: Color {return Color(red: .xFB, green: .x3C, blue: .x02)}
    static var cE60033: Color {return Color(red: .xE6, green: .x00, blue: .x33)}
    static var cF9204D: Color {return Color(red: .xF9, green: .x20, blue: .x4D)}
    static var cE2041B: Color {return Color(red: .xE2, green: .x04, blue: .x1B)}
    static var cFF251E: Color {return Color(red: .xFF, green: .x25, blue: .x1E)}
    static var cC51C2F: Color {return Color(red: .xC5, green: .x1C, blue: .x2F)}
    static var cBA2636: Color {return Color(red: .xBA, green: .x26, blue: .x36)}
    static var cCC2F3A: Color {return Color(red: .xCC, green: .x2F, blue: .x3A)}
    static var cD9333F: Color {return Color(red: .xD9, green: .x33, blue: .x3F)}
    static var cB7282E: Color {return Color(red: .xB7, green: .x28, blue: .x2E)}
    static var cC53D43: Color {return Color(red: .xC5, green: .x3D, blue: .x43)}
    static var cD20A13: Color {return Color(red: .xD2, green: .x0A, blue: .x13)}
    static var cC9171E: Color {return Color(red: .xC9, green: .x17, blue: .x1E)}
    static var cE73931: Color {return Color(red: .xE7, green: .x39, blue: .x31)}
    static var cD91E10: Color {return Color(red: .xD9, green: .x1E, blue: .x10)}
    static var cE83929: Color {return Color(red: .xE8, green: .x39, blue: .x29)}
    static var cCF3525: Color {return Color(red: .xCF, green: .x35, blue: .x25)}
    static var cCE5242: Color {return Color(red: .xCE, green: .x52, blue: .x42)}
    static var cD3381C: Color {return Color(red: .xD3, green: .x38, blue: .x1C)}
    static var cB43219: Color {return Color(red: .xB4, green: .x32, blue: .x19)}
    static var cC62B0C: Color {return Color(red: .xC6, green: .x2B, blue: .x0C)}
    static var cBB5535: Color {return Color(red: .xBB, green: .x55, blue: .x35)}
    static var cCD5E3C: Color {return Color(red: .xCD, green: .x5E, blue: .x3C)}
    static var cEB6238: Color {return Color(red: .xEB, green: .x62, blue: .x38)}
    static var cA25768: Color {return Color(red: .xA2, green: .x57, blue: .x68)}
    static var cD0576B: Color {return Color(red: .xD0, green: .x57, blue: .x6B)}
    static var cB94047: Color {return Color(red: .xB9, green: .x40, blue: .x47)}
    static var cB95054: Color {return Color(red: .xB9, green: .x50, blue: .x54)}
    static var c9E3D3F: Color {return Color(red: .x9E, green: .x3D, blue: .x3F)}
    static var cAC2424: Color {return Color(red: .xAC, green: .x24, blue: .x24)}
    static var cCC5959: Color {return Color(red: .xCC, green: .x59, blue: .x59)}
    static var cA73836: Color {return Color(red: .xA7, green: .x38, blue: .x36)}
    static var cC85554: Color {return Color(red: .xC8, green: .x55, blue: .x54)}
    static var c96514D: Color {return Color(red: .x96, green: .x51, blue: .x4D)}
    static var cA03731: Color {return Color(red: .xA0, green: .x37, blue: .x31)}
    static var cA86965: Color {return Color(red: .xA8, green: .x69, blue: .x65)}
    static var c91453F: Color {return Color(red: .x91, green: .x45, blue: .x3F)}
    static var c8C4841: Color {return Color(red: .x8C, green: .x48, blue: .x41)}
    static var c95483F: Color {return Color(red: .x95, green: .x48, blue: .x3F)}
    static var c9A493F: Color {return Color(red: .x9A, green: .x49, blue: .x3F)}
    static var cBB5548: Color {return Color(red: .xBB, green: .x55, blue: .x48)}
    static var c965042: Color {return Color(red: .x96, green: .x50, blue: .x42)}
    static var cB14329: Color {return Color(red: .xB1, green: .x43, blue: .x29)}
    static var cAA4F37: Color {return Color(red: .xAA, green: .x4F, blue: .x37)}
    static var c915847: Color {return Color(red: .x91, green: .x58, blue: .x47)}
    static var cA16D5D: Color {return Color(red: .xA1, green: .x6D, blue: .x5D)}
    static var cA24629: Color {return Color(red: .xA2, green: .x46, blue: .x29)}
    static var cB55233: Color {return Color(red: .xB5, green: .x52, blue: .x33)}
    static var cA22041: Color {return Color(red: .xA2, green: .x20, blue: .x41)}
    static var cA61017: Color {return Color(red: .xA6, green: .x10, blue: .x17)}
    static var c762034: Color {return Color(red: .x76, green: .x20, blue: .x34)}
    static var c8B2F45: Color {return Color(red: .x8B, green: .x2F, blue: .x45)}
    static var c753035: Color {return Color(red: .x75, green: .x30, blue: .x35)}
    static var c773328: Color {return Color(red: .x77, green: .x33, blue: .x28)}
    static var c773C30: Color {return Color(red: .x77, green: .x3C, blue: .x30)}
    static var c852E19: Color {return Color(red: .x85, green: .x2E, blue: .x19)}
    static var c8F2E14: Color {return Color(red: .x8F, green: .x2E, blue: .x14)}
    static var c6C3524: Color {return Color(red: .x6C, green: .x35, blue: .x24)}
    static var c8A3319: Color {return Color(red: .x8A, green: .x33, blue: .x19)}
    static var c5C2D36: Color {return Color(red: .x5C, green: .x2D, blue: .x36)}
    static var c6C2C2F: Color {return Color(red: .x6C, green: .x2C, blue: .x2F)}
    static var c6B3E3F: Color {return Color(red: .x6B, green: .x3E, blue: .x3F)}
    static var c76413C: Color {return Color(red: .x76, green: .x41, blue: .x3C)}
    static var c7B4741: Color {return Color(red: .x7B, green: .x47, blue: .x41)}
    static var c6F514C: Color {return Color(red: .x6F, green: .x51, blue: .x4C)}
    static var c6D3C32: Color {return Color(red: .x6D, green: .x3C, blue: .x32)}
    static var c683F36: Color {return Color(red: .x68, green: .x3F, blue: .x36)}
    static var c8F6769: Color {return Color(red: .x8F, green: .x67, blue: .x69)}
    static var c836364: Color {return Color(red: .x83, green: .x63, blue: .x64)}
    static var cA06F70: Color {return Color(red: .xA0, green: .x6F, blue: .x70)}
    static var c9B7877: Color {return Color(red: .x9B, green: .x78, blue: .x77)}
    static var c896361: Color {return Color(red: .x89, green: .x63, blue: .x61)}
    static var c8F6361: Color {return Color(red: .x8F, green: .x63, blue: .x61)}
    static var c8E655F: Color {return Color(red: .x8E, green: .x65, blue: .x5F)}
    static var c875B4E: Color {return Color(red: .x87, green: .x5B, blue: .x4E)}
    static var cDE8397: Color {return Color(red: .xDE, green: .x83, blue: .x97)}
    static var cC97586: Color {return Color(red: .xC9, green: .x75, blue: .x86)}
    static var cE891A3: Color {return Color(red: .xE8, green: .x91, blue: .xA3)}
    static var cC099A0: Color {return Color(red: .xC0, green: .x99, blue: .xA0)}
    static var cCF747B: Color {return Color(red: .xCF, green: .x74, blue: .x7B)}
    static var cDF9D9F: Color {return Color(red: .xDF, green: .x9D, blue: .x9F)}
    static var cD69090: Color {return Color(red: .xD6, green: .x90, blue: .x90)}
    static var cB88884: Color {return Color(red: .xB8, green: .x88, blue: .x84)}
    static var cE09285: Color {return Color(red: .xE0, green: .x92, blue: .x85)}
    static var cEF9683: Color {return Color(red: .xEF, green: .x96, blue: .x83)}
    static var cE09E87: Color {return Color(red: .xE0, green: .x9E, blue: .x87)}
    static var cC18772: Color {return Color(red: .xC1, green: .x87, blue: .x72)}
    static var cD7A98C: Color {return Color(red: .xD7, green: .xA9, blue: .x8C)}
    static var cE0A37E: Color {return Color(red: .xE0, green: .xA3, blue: .x7E)}
    static var cDDBB99: Color {return Color(red: .xDD, green: .xBB, blue: .x99)}
    static var cF3BF88: Color {return Color(red: .xF3, green: .xBF, blue: .x88)}
    static var cE0C38C: Color {return Color(red: .xE0, green: .xC3, blue: .x8C)}
    static var cCBB994: Color {return Color(red: .xCB, green: .xB9, blue: .x94)}
    static var cA58F86: Color {return Color(red: .xA5, green: .x8F, blue: .x86)}
    static var c856859: Color {return Color(red: .x85, green: .x68, blue: .x59)}
    static var c8C6450: Color {return Color(red: .x8C, green: .x64, blue: .x50)}
    static var cB48A76: Color {return Color(red: .xB4, green: .x8A, blue: .x76)}
    static var c928178: Color {return Color(red: .x92, green: .x81, blue: .x78)}
    static var c836A5C: Color {return Color(red: .x83, green: .x6A, blue: .x5C)}
    static var c8D6448: Color {return Color(red: .x8D, green: .x64, blue: .x48)}
    static var c8D6449: Color {return Color(red: .x8D, green: .x64, blue: .x49)}
    static var cB28C6E: Color {return Color(red: .xB2, green: .x8C, blue: .x6E)}
    static var cA68868: Color {return Color(red: .xA6, green: .x88, blue: .x68)}
    static var c7E6A4C: Color {return Color(red: .x7E, green: .x6A, blue: .x4C)}
    static var c9D896C: Color {return Color(red: .x9D, green: .x89, blue: .x6C)}
    static var c8C7042: Color {return Color(red: .x8C, green: .x70, blue: .x42)}
    static var c94846A: Color {return Color(red: .x94, green: .x84, blue: .x6A)}
    static var c897858: Color {return Color(red: .x89, green: .x78, blue: .x58)}
    static var c807050: Color {return Color(red: .x80, green: .x70, blue: .x50)}
    static var c93866C: Color {return Color(red: .x93, green: .x86, blue: .x6C)}
    static var c9E9478: Color {return Color(red: .x9E, green: .x94, blue: .x78)}
    static var c664032: Color {return Color(red: .x66, green: .x40, blue: .x32)}
    static var c6F4B3E: Color {return Color(red: .x6F, green: .x4B, blue: .x3E)}
    static var c643219: Color {return Color(red: .x64, green: .x32, blue: .x19)}
    static var c583822: Color {return Color(red: .x58, green: .x38, blue: .x22)}
    static var c735642: Color {return Color(red: .x73, green: .x56, blue: .x42)}
    static var c765C47: Color {return Color(red: .x76, green: .x5C, blue: .x47)}
    static var c61462E: Color {return Color(red: .x61, green: .x46, blue: .x2E)}
    static var c685643: Color {return Color(red: .x68, green: .x56, blue: .x43)}
    static var c736250: Color {return Color(red: .x73, green: .x62, blue: .x50)}
    static var c726250: Color {return Color(red: .x72, green: .x62, blue: .x50)}
    static var c685641: Color {return Color(red: .x68, green: .x56, blue: .x41)}
    static var c716246: Color {return Color(red: .x71, green: .x62, blue: .x46)}
    static var c5C4F2C: Color {return Color(red: .x5C, green: .x4F, blue: .x2C)}
    static var c752100: Color {return Color(red: .x75, green: .x21, blue: .x00)}
    static var c954E2A: Color {return Color(red: .x95, green: .x4E, blue: .x2A)}
    static var c783C1D: Color {return Color(red: .x78, green: .x3C, blue: .x1D)}
    static var c8E3809: Color {return Color(red: .x8E, green: .x38, blue: .x09)}
    static var c98502A: Color {return Color(red: .x98, green: .x50, blue: .x2A)}
    static var c762F07: Color {return Color(red: .x76, green: .x2F, blue: .x07)}
    static var c5F2C0D: Color {return Color(red: .x5F, green: .x2C, blue: .x0D)}
    static var c7D4B28: Color {return Color(red: .x7D, green: .x4B, blue: .x28)}
    static var c8A3B00: Color {return Color(red: .x8A, green: .x3B, blue: .x00)}
    static var c7E5737: Color {return Color(red: .x7E, green: .x57, blue: .x37)}
    static var c815731: Color {return Color(red: .x81, green: .x57, blue: .x31)}
    static var c956F29: Color {return Color(red: .x95, green: .x6F, blue: .x29)}
    static var c7C5B0C: Color {return Color(red: .x7C, green: .x5B, blue: .x0C)}
    static var c715C23: Color {return Color(red: .x71, green: .x5C, blue: .x23)}
    static var c4D1A06: Color {return Color(red: .x4D, green: .x1A, blue: .x06)}
    static var cC44303: Color {return Color(red: .xC4, green: .x43, blue: .x03)}
    static var cB38000: Color {return Color(red: .xB3, green: .x80, blue: .x00)}
    static var cAB6953: Color {return Color(red: .xAB, green: .x69, blue: .x53)}
    static var c965036: Color {return Color(red: .x96, green: .x50, blue: .x36)}
    static var c9F563A: Color {return Color(red: .x9F, green: .x56, blue: .x3A)}
    static var cAB4A24: Color {return Color(red: .xAB, green: .x4A, blue: .x24)}
    static var c975E45: Color {return Color(red: .x97, green: .x5E, blue: .x45)}
    static var cC37854: Color {return Color(red: .xC3, green: .x78, blue: .x54)}
    static var c9F6F55: Color {return Color(red: .x9F, green: .x6F, blue: .x55)}
    static var cB4866B: Color {return Color(red: .xB4, green: .x86, blue: .x6B)}
    static var cB78161: Color {return Color(red: .xB7, green: .x81, blue: .x61)}
    static var c946243: Color {return Color(red: .x94, green: .x62, blue: .x43)}
    static var cA86F4C: Color {return Color(red: .xA8, green: .x6F, blue: .x4C)}
    static var cB77B57: Color {return Color(red: .xB7, green: .x7B, blue: .x57)}
    static var cBF794E: Color {return Color(red: .xBF, green: .x79, blue: .x4E)}
    static var c98623C: Color {return Color(red: .x98, green: .x62, blue: .x3C)}
    static var cAE7C58: Color {return Color(red: .xAE, green: .x7C, blue: .x58)}
    static var cCD8C5C: Color {return Color(red: .xCD, green: .x8C, blue: .x5C)}
    static var cBC763C: Color {return Color(red: .xBC, green: .x76, blue: .x3C)}
    static var cCB8347: Color {return Color(red: .xCB, green: .x83, blue: .x47)}
    static var cA78465: Color {return Color(red: .xA7, green: .x84, blue: .x65)}
    static var cAE7C4F: Color {return Color(red: .xAE, green: .x7C, blue: .x4F)}
    static var cAD7D4C: Color {return Color(red: .xAD, green: .x7D, blue: .x4C)}
    static var cAD7E4E: Color {return Color(red: .xAD, green: .x7E, blue: .x4E)}
    static var c9B7853: Color {return Color(red: .x9B, green: .x78, blue: .x53)}
    static var cC38743: Color {return Color(red: .xC3, green: .x87, blue: .x43)}
    static var cB39469: Color {return Color(red: .xB3, green: .x94, blue: .x69)}
    static var c917347: Color {return Color(red: .x91, green: .x73, blue: .x47)}
    static var cB68D4C: Color {return Color(red: .xB6, green: .x8D, blue: .x4C)}
    static var cB98C46: Color {return Color(red: .xB9, green: .x8C, blue: .x46)}
    static var cC39143: Color {return Color(red: .xC3, green: .x91, blue: .x43)}
    static var c9E875E: Color {return Color(red: .x9E, green: .x87, blue: .x5E)}
    static var cBFA46F: Color {return Color(red: .xBF, green: .xA4, blue: .x6F)}
    static var cCFA85C: Color {return Color(red: .xCF, green: .xA8, blue: .x5C)}
    static var cA28D5A: Color {return Color(red: .xA2, green: .x8D, blue: .x5A)}
    static var cB79B5B: Color {return Color(red: .xB7, green: .x9B, blue: .x5B)}
    static var cE45E32: Color {return Color(red: .xE4, green: .x5E, blue: .x32)}
    static var cED6D3D: Color {return Color(red: .xED, green: .x6D, blue: .x3D)}
    static var cC04D21: Color {return Color(red: .xC0, green: .x4D, blue: .x21)}
    static var cC9582C: Color {return Color(red: .xC9, green: .x58, blue: .x2C)}
    static var cD25E2C: Color {return Color(red: .xD2, green: .x5E, blue: .x2C)}
    static var cD1561B: Color {return Color(red: .xD1, green: .x56, blue: .x1B)}
    static var cF56A29: Color {return Color(red: .xF5, green: .x6A, blue: .x29)}
    static var cCF6A38: Color {return Color(red: .xCF, green: .x6A, blue: .x38)}
    static var cD66A35: Color {return Color(red: .xD6, green: .x6A, blue: .x35)}
    static var cBB5520: Color {return Color(red: .xBB, green: .x55, blue: .x20)}
    static var cDB8449: Color {return Color(red: .xDB, green: .x84, blue: .x49)}
    static var cE17B34: Color {return Color(red: .xE1, green: .x7B, blue: .x34)}
    static var cCF752C: Color {return Color(red: .xCF, green: .x75, blue: .x2C)}
    static var cBF783A: Color {return Color(red: .xBF, green: .x78, blue: .x3A)}
    static var cDE9A41: Color {return Color(red: .xDE, green: .x9A, blue: .x41)}
    static var cD9912D: Color {return Color(red: .xD9, green: .x91, blue: .x2D)}
    static var cFFB02A: Color {return Color(red: .xFF, green: .xB0, blue: .x2A)}
    static var cD3A243: Color {return Color(red: .xD3, green: .xA2, blue: .x43)}
    static var cC89932: Color {return Color(red: .xC8, green: .x99, blue: .x32)}
    static var cD9A62E: Color {return Color(red: .xD9, green: .xA6, blue: .x2E)}
    static var cEA5506: Color {return Color(red: .xEA, green: .x55, blue: .x06)}
    static var cEB6101: Color {return Color(red: .xEB, green: .x61, blue: .x01)}
    static var cEC6800: Color {return Color(red: .xEC, green: .x68, blue: .x00)}
    static var cEE7800: Color {return Color(red: .xEE, green: .x78, blue: .x00)}
    static var cF08300: Color {return Color(red: .xF0, green: .x83, blue: .x00)}
    static var cF69E22: Color {return Color(red: .xF6, green: .x9E, blue: .x22)}
    static var cF39800: Color {return Color(red: .xF3, green: .x98, blue: .x00)}
    static var cF8B500: Color {return Color(red: .xF8, green: .xB5, blue: .x00)}
    static var cEE7948: Color {return Color(red: .xEE, green: .x79, blue: .x48)}
    static var cFF9740: Color {return Color(red: .xFF, green: .x97, blue: .x40)}
    static var cFE9C41: Color {return Color(red: .xFE, green: .x9C, blue: .x41)}
    static var cF6AD49: Color {return Color(red: .xF6, green: .xAD, blue: .x49)}
    static var cFFB333: Color {return Color(red: .xFF, green: .xB3, blue: .x33)}
    static var cFBCA4D: Color {return Color(red: .xFB, green: .xCA, blue: .x4D)}
    static var cCA8269: Color {return Color(red: .xCA, green: .x82, blue: .x69)}
    static var cDD7A56: Color {return Color(red: .xDD, green: .x7A, blue: .x56)}
    static var cE0815E: Color {return Color(red: .xE0, green: .x81, blue: .x5E)}
    static var cEB9B6F: Color {return Color(red: .xEB, green: .x9B, blue: .x6F)}
    static var cE49E61: Color {return Color(red: .xE4, green: .x9E, blue: .x61)}
    static var cD8A373: Color {return Color(red: .xD8, green: .xA3, blue: .x73)}
    static var cF7B977: Color {return Color(red: .xF7, green: .xB9, blue: .x77)}
    static var cF8B862: Color {return Color(red: .xF8, green: .xB8, blue: .x62)}
    static var cFFC06A: Color {return Color(red: .xFF, green: .xC0, blue: .x6A)}
    static var cDEB068: Color {return Color(red: .xDE, green: .xB0, blue: .x68)}
    static var cEEC362: Color {return Color(red: .xEE, green: .xC3, blue: .x62)}
    static var cFBD26B: Color {return Color(red: .xFB, green: .xD2, blue: .x6B)}
    static var cFCD575: Color {return Color(red: .xFC, green: .xD5, blue: .x75)}
    static var cF1CB66: Color {return Color(red: .xF1, green: .xCB, blue: .x66)}
    static var cEFAB93: Color {return Color(red: .xEF, green: .xAB, blue: .x93)}
    static var cF5B199: Color {return Color(red: .xF5, green: .xB1, blue: .x99)}
    static var cFFAC8C: Color {return Color(red: .xFF, green: .xAC, blue: .x8C)}
    static var cF6B894: Color {return Color(red: .xF6, green: .xB8, blue: .x94)}
    static var cF1BF99: Color {return Color(red: .xF1, green: .xBF, blue: .x99)}
    static var cF7BD8F: Color {return Color(red: .xF7, green: .xBD, blue: .x8F)}
    static var cF9C89B: Color {return Color(red: .xF9, green: .xC8, blue: .x9B)}
    static var cF0CFA0: Color {return Color(red: .xF0, green: .xCF, blue: .xA0)}
    static var cEFCD9A: Color {return Color(red: .xEF, green: .xCD, blue: .x9A)}
    static var cFDDEA5: Color {return Color(red: .xFD, green: .xDE, blue: .xA5)}
    static var cF2C9AC: Color {return Color(red: .xF2, green: .xC9, blue: .xAC)}
    static var cECD4C2: Color {return Color(red: .xEC, green: .xD4, blue: .xC2)}
    static var cFCE2C4: Color {return Color(red: .xFC, green: .xE2, blue: .xC4)}
    static var cFDE8D0: Color {return Color(red: .xFD, green: .xE8, blue: .xD0)}
    static var cD6C6AF: Color {return Color(red: .xD6, green: .xC6, blue: .xAF)}
    static var cEDD3A1: Color {return Color(red: .xED, green: .xD3, blue: .xA1)}
    static var cFFEECE: Color {return Color(red: .xFF, green: .xEE, blue: .xCE)}
    static var cF4DDA5: Color {return Color(red: .xF4, green: .xDD, blue: .xA5)}
    static var cFFF1CF: Color {return Color(red: .xFF, green: .xF1, blue: .xCF)}
    static var cDCD3B2: Color {return Color(red: .xDC, green: .xD3, blue: .xB2)}
    static var cEBE1A9: Color {return Color(red: .xEB, green: .xE1, blue: .xA9)}
    static var cF2F2B0: Color {return Color(red: .xF2, green: .xF2, blue: .xB0)}
    static var cE8EAA8: Color {return Color(red: .xE8, green: .xEA, blue: .xA8)}
    static var cE0EBAF: Color {return Color(red: .xE0, green: .xEB, blue: .xAF)}
    static var cF8E58C: Color {return Color(red: .xF8, green: .xE5, blue: .x8C)}
    static var cE5DB97: Color {return Color(red: .xE5, green: .xDB, blue: .x97)}
    static var cD8E698: Color {return Color(red: .xD8, green: .xE6, blue: .x98)}
    static var cF2D675: Color {return Color(red: .xF2, green: .xD6, blue: .x75)}
    static var cF5E56B: Color {return Color(red: .xF5, green: .xE5, blue: .x6B)}
    static var cF1E266: Color {return Color(red: .xF1, green: .xE2, blue: .x66)}
    static var cFEF263: Color {return Color(red: .xFE, green: .xF2, blue: .x63)}
    static var cF3F47F: Color {return Color(red: .xF3, green: .xF4, blue: .x7F)}
    static var cC7DC68: Color {return Color(red: .xC7, green: .xDC, blue: .x68)}
    static var cFFDB4F: Color {return Color(red: .xFF, green: .xDB, blue: .x4F)}
    static var cFFEC47: Color {return Color(red: .xFF, green: .xEC, blue: .x47)}
    static var cFCC800: Color {return Color(red: .xFC, green: .xC8, blue: .x00)}
    static var cFFD900: Color {return Color(red: .xFF, green: .xD9, blue: .x00)}
    static var cFFEA00: Color {return Color(red: .xFF, green: .xEA, blue: .x00)}
    static var cFABF14: Color {return Color(red: .xFA, green: .xBF, blue: .x14)}
    static var cF7C114: Color {return Color(red: .xF7, green: .xC1, blue: .x14)}
    static var cE6B422: Color {return Color(red: .xE6, green: .xB4, blue: .x22)}
    static var cEBD842: Color {return Color(red: .xEB, green: .xD8, blue: .x42)}
    static var cDCCB18: Color {return Color(red: .xDC, green: .xCB, blue: .x18)}
    static var cD7CF3A: Color {return Color(red: .xD7, green: .xCF, blue: .x3A)}
    static var cF3F133: Color {return Color(red: .xF3, green: .xF1, blue: .x33)}
    static var cB8D200: Color {return Color(red: .xB8, green: .xD2, blue: .x00)}
    static var cC3D825: Color {return Color(red: .xC3, green: .xD8, blue: .x25)}
    static var cA0873C: Color {return Color(red: .xA0, green: .x87, blue: .x3C)}
    static var cA59564: Color {return Color(red: .xA5, green: .x95, blue: .x64)}
    static var cD0AF4C: Color {return Color(red: .xD0, green: .xAF, blue: .x4C)}
    static var cA19361: Color {return Color(red: .xA1, green: .x93, blue: .x61)}
    static var cA69425: Color {return Color(red: .xA6, green: .x94, blue: .x25)}
    static var cBCAD48: Color {return Color(red: .xBC, green: .xAD, blue: .x48)}
    static var c938B4B: Color {return Color(red: .x93, green: .x8B, blue: .x4B)}
    static var cADA250: Color {return Color(red: .xAD, green: .xA2, blue: .x50)}
    static var cD5C752: Color {return Color(red: .xD5, green: .xC7, blue: .x52)}
    static var cB1A733: Color {return Color(red: .xB1, green: .xA7, blue: .x33)}
    static var cC5C56A: Color {return Color(red: .xC5, green: .xC5, blue: .x6A)}
    static var cA7B446: Color {return Color(red: .xA7, green: .xB4, blue: .x46)}
    static var c99AB4E: Color {return Color(red: .x99, green: .xAB, blue: .x4E)}
    static var c7B8D42: Color {return Color(red: .x7B, green: .x8D, blue: .x42)}
    static var cB19A00: Color {return Color(red: .xB1, green: .x9A, blue: .x00)}
    static var cC2BF00: Color {return Color(red: .xC2, green: .xBF, blue: .x00)}
    static var c715C1F: Color {return Color(red: .x71, green: .x5C, blue: .x1F)}
    static var c6A5D21: Color {return Color(red: .x6A, green: .x5D, blue: .x21)}
    static var c887938: Color {return Color(red: .x88, green: .x79, blue: .x38)}
    static var c928C36: Color {return Color(red: .x92, green: .x8C, blue: .x36)}
    static var c7B6C3E: Color {return Color(red: .x7B, green: .x6C, blue: .x3E)}
    static var c746D4E: Color {return Color(red: .x74, green: .x6D, blue: .x4E)}
    static var c72672E: Color {return Color(red: .x72, green: .x67, blue: .x2E)}
    static var c665D22: Color {return Color(red: .x66, green: .x5D, blue: .x22)}
    static var c726D40: Color {return Color(red: .x72, green: .x6D, blue: .x40)}
    static var c8F8667: Color {return Color(red: .x8F, green: .x86, blue: .x67)}
    static var c918754: Color {return Color(red: .x91, green: .x87, blue: .x54)}
    static var c8C8861: Color {return Color(red: .x8C, green: .x88, blue: .x61)}
    static var c9B9969: Color {return Color(red: .x9B, green: .x99, blue: .x69)}
    static var cA1A46D: Color {return Color(red: .xA1, green: .xA4, blue: .x6D)}
    static var c787A59: Color {return Color(red: .x78, green: .x7A, blue: .x59)}
    static var cC7B370: Color {return Color(red: .xC7, green: .xB3, blue: .x70)}
    static var cE4DC8A: Color {return Color(red: .xE4, green: .xDC, blue: .x8A)}
    static var cB0CA71: Color {return Color(red: .xB0, green: .xCA, blue: .x71)}
    static var cB9D08B: Color {return Color(red: .xB9, green: .xD0, blue: .x8B)}
    static var cA8C97F: Color {return Color(red: .xA8, green: .xC9, blue: .x7F)}
    static var cA8BF93: Color {return Color(red: .xA8, green: .xBF, blue: .x93)}
    static var c93CA76: Color {return Color(red: .x93, green: .xCA, blue: .x76)}
    static var c93B881: Color {return Color(red: .x93, green: .xB8, blue: .x81)}
    static var c94B090: Color {return Color(red: .x94, green: .xB0, blue: .x90)}
    static var c98D98E: Color {return Color(red: .x98, green: .xD9, blue: .x8E)}
    static var c88CB7F: Color {return Color(red: .x88, green: .xCB, blue: .x7F)}
    static var c6E7955: Color {return Color(red: .x6E, green: .x79, blue: .x55)}
    static var c748450: Color {return Color(red: .x74, green: .x84, blue: .x50)}
    static var c919F74: Color {return Color(red: .x91, green: .x9F, blue: .x74)}
    static var c839B5C: Color {return Color(red: .x83, green: .x9B, blue: .x5C)}
    static var c6E8252: Color {return Color(red: .x6E, green: .x82, blue: .x52)}
    static var c769164: Color {return Color(red: .x76, green: .x91, blue: .x64)}
    static var c81A96E: Color {return Color(red: .x81, green: .xA9, blue: .x6E)}
    static var c6F8566: Color {return Color(red: .x6F, green: .x85, blue: .x66)}
    static var c596A40: Color {return Color(red: .x59, green: .x6A, blue: .x40)}
    static var c43552A: Color {return Color(red: .x43, green: .x55, blue: .x2A)}
    static var c396122: Color {return Color(red: .x39, green: .x61, blue: .x22)}
    static var c69821B: Color {return Color(red: .x69, green: .x82, blue: .x1B)}
    static var c26610F: Color {return Color(red: .x26, green: .x61, blue: .x0F)}
    static var c48922F: Color {return Color(red: .x48, green: .x92, blue: .x2F)}
    static var c2E7E16: Color {return Color(red: .x2E, green: .x7E, blue: .x16)}
    static var c67A70C: Color {return Color(red: .x67, green: .xA7, blue: .x0C)}
    static var cAACF53: Color {return Color(red: .xAA, green: .xCF, blue: .x53)}
    static var c82AE46: Color {return Color(red: .x82, green: .xAE, blue: .x46)}
    static var c5F984D: Color {return Color(red: .x5F, green: .x98, blue: .x4D)}
    static var c339933: Color {return Color(red: .x33, green: .x99, blue: .x33)}
    static var c69B076: Color {return Color(red: .x69, green: .xB0, blue: .x76)}
    static var cCEE4AE: Color {return Color(red: .xCE, green: .xE4, blue: .xAE)}
    static var cC1D8AC: Color {return Color(red: .xC1, green: .xD8, blue: .xAC)}
    static var cBADCAD: Color {return Color(red: .xBA, green: .xDC, blue: .xAD)}
    static var c50A06E: Color {return Color(red: .x50, green: .xA0, blue: .x6E)}
    static var c3EB370: Color {return Color(red: .x3E, green: .xB3, blue: .x70)}
    static var c68BE8D: Color {return Color(red: .x68, green: .xBE, blue: .x8D)}
    static var c38B48B: Color {return Color(red: .x38, green: .xB4, blue: .x8B)}
    static var c00A381: Color {return Color(red: .x00, green: .xA3, blue: .x81)}
    static var c00A497: Color {return Color(red: .x00, green: .xA4, blue: .x97)}
    static var c00552E: Color {return Color(red: .x00, green: .x55, blue: .x2E)}
    static var c083A28: Color {return Color(red: .x08, green: .x3A, blue: .x28)}
    static var c02533B: Color {return Color(red: .x02, green: .x53, blue: .x3B)}
    static var c013224: Color {return Color(red: .x01, green: .x32, blue: .x24)}
    static var c005243: Color {return Color(red: .x00, green: .x52, blue: .x43)}
    static var c32875C: Color {return Color(red: .x32, green: .x87, blue: .x5C)}
    static var c007B43: Color {return Color(red: .x00, green: .x7B, blue: .x43)}
    static var c028760: Color {return Color(red: .x02, green: .x87, blue: .x60)}
    static var c006E54: Color {return Color(red: .x00, green: .x6E, blue: .x54)}
    static var c006956: Color {return Color(red: .x00, green: .x69, blue: .x56)}
    static var c00786C: Color {return Color(red: .x00, green: .x78, blue: .x6C)}
    static var c316745: Color {return Color(red: .x31, green: .x67, blue: .x45)}
    static var c3B7960: Color {return Color(red: .x3B, green: .x79, blue: .x60)}
    static var c2F5D50: Color {return Color(red: .x2F, green: .x5D, blue: .x50)}
    static var c38635D: Color {return Color(red: .x38, green: .x63, blue: .x5D)}
    static var c206865: Color {return Color(red: .x20, green: .x68, blue: .x65)}
    static var c47885E: Color {return Color(red: .x47, green: .x88, blue: .x5E)}
    static var c80ABA9: Color {return Color(red: .x80, green: .xAB, blue: .xA9)}
    static var c5C9291: Color {return Color(red: .x5C, green: .x92, blue: .x91)}
    static var c93B69C: Color {return Color(red: .x93, green: .xB6, blue: .x9C)}
    static var c7BC496: Color {return Color(red: .x7B, green: .xC4, blue: .x96)}
    static var c7EBEA5: Color {return Color(red: .x7E, green: .xBE, blue: .xA5)}
    static var c92B5A9: Color {return Color(red: .x92, green: .xB5, blue: .xA9)}
    static var c7EBEAB: Color {return Color(red: .x7E, green: .xBE, blue: .xAB)}
    static var c9ED1D3: Color {return Color(red: .x9E, green: .xD1, blue: .xD3)}
    static var c83CCD2: Color {return Color(red: .x83, green: .xCC, blue: .xD2)}
    static var c72C1C8: Color {return Color(red: .x72, green: .xC1, blue: .xC8)}
    static var c84B9CB: Color {return Color(red: .x84, green: .xB9, blue: .xCB)}
    static var c89C3EB: Color {return Color(red: .x89, green: .xC3, blue: .xEB)}
    static var c98AEC1: Color {return Color(red: .x98, green: .xAE, blue: .xC1)}
    static var c478384: Color {return Color(red: .x47, green: .x83, blue: .x84)}
    static var c789295: Color {return Color(red: .x78, green: .x92, blue: .x95)}
    static var c80989B: Color {return Color(red: .x80, green: .x98, blue: .x9B)}
    static var c53727D: Color {return Color(red: .x53, green: .x72, blue: .x7D)}
    static var c6C848D: Color {return Color(red: .x6C, green: .x84, blue: .x8D)}
    static var c5B7E91: Color {return Color(red: .x5B, green: .x7E, blue: .x91)}
    static var c83959F: Color {return Color(red: .x83, green: .x95, blue: .x9F)}
    static var c43676B: Color {return Color(red: .x43, green: .x67, blue: .x6B)}
    static var c2C4F54: Color {return Color(red: .x2C, green: .x4F, blue: .x54)}
    static var c184458: Color {return Color(red: .x18, green: .x44, blue: .x58)}
    static var c426579: Color {return Color(red: .x42, green: .x65, blue: .x79)}
    static var c4C6473: Color {return Color(red: .x4C, green: .x64, blue: .x73)}
    static var c44617B: Color {return Color(red: .x44, green: .x61, blue: .x7B)}
    static var c175B66: Color {return Color(red: .x17, green: .x5B, blue: .x66)}
    static var c00708E: Color {return Color(red: .x00, green: .x70, blue: .x8E)}
    static var c165E83: Color {return Color(red: .x16, green: .x5E, blue: .x83)}
    static var c034358: Color {return Color(red: .x03, green: .x43, blue: .x58)}
    static var c00A3AF: Color {return Color(red: .x00, green: .xA3, blue: .xAF)}
    static var c008899: Color {return Color(red: .x00, green: .x88, blue: .x99)}
    static var c0094C8: Color {return Color(red: .x00, green: .x94, blue: .xC8)}
    static var c007BBB: Color {return Color(red: .x00, green: .x7B, blue: .xBB)}
    static var c28A3AF: Color {return Color(red: .x28, green: .xA3, blue: .xAF)}
    static var c59B9C6: Color {return Color(red: .x59, green: .xB9, blue: .xC6)}
    static var c2A83A2: Color {return Color(red: .x2A, green: .x83, blue: .xA2)}
    static var c507EA4: Color {return Color(red: .x50, green: .x7E, blue: .xA4)}
    static var c0095D9: Color {return Color(red: .x00, green: .x95, blue: .xD9)}
    static var c2792C3: Color {return Color(red: .x27, green: .x92, blue: .xC3)}
    static var c2CA9E1: Color {return Color(red: .x2C, green: .xA9, blue: .xE1)}
    static var c38A1DB: Color {return Color(red: .x38, green: .xA1, blue: .xDB)}
    static var c69C2C7: Color {return Color(red: .x69, green: .xC2, blue: .xC7)}
    static var cA0D8EF: Color {return Color(red: .xA0, green: .xD8, blue: .xEF)}
    static var cA2D7DD: Color {return Color(red: .xA2, green: .xD7, blue: .xDD)}
    static var cBCE2E8: Color {return Color(red: .xBC, green: .xE2, blue: .xE8)}
    static var cABCED8: Color {return Color(red: .xAB, green: .xCE, blue: .xD8)}
    static var cBBC8E6: Color {return Color(red: .xBB, green: .xC8, blue: .xE6)}
    static var c1853B5: Color {return Color(red: .x18, green: .x53, blue: .xB5)}
    static var c3967C4: Color {return Color(red: .x39, green: .x67, blue: .xC4)}
    static var c3D6EDA: Color {return Color(red: .x3D, green: .x6E, blue: .xDA)}
    static var c6D93B9: Color {return Color(red: .x6D, green: .x93, blue: .xB9)}
    static var c5383C3: Color {return Color(red: .x53, green: .x83, blue: .xC3)}
    static var c3E62AD: Color {return Color(red: .x3E, green: .x62, blue: .xAD)}
    static var c4C6CB3: Color {return Color(red: .x4C, green: .x6C, blue: .xB3)}
    static var c5A79BA: Color {return Color(red: .x5A, green: .x79, blue: .xBA)}
    static var c2A42A6: Color {return Color(red: .x2A, green: .x42, blue: .xA6)}
    static var c4D5AAF: Color {return Color(red: .x4D, green: .x5A, blue: .xAF)}
    static var c5654A2: Color {return Color(red: .x56, green: .x54, blue: .xA2)}
    static var c4D4398: Color {return Color(red: .x4D, green: .x43, blue: .x98)}
    static var c124DAE: Color {return Color(red: .x12, green: .x4D, blue: .xAE)}
    static var c1E50A2: Color {return Color(red: .x1E, green: .x50, blue: .xA2)}
    static var c0F2350: Color {return Color(red: .x0F, green: .x23, blue: .x50)}
    static var c081941: Color {return Color(red: .x08, green: .x19, blue: .x41)}
    static var c17184B: Color {return Color(red: .x17, green: .x18, blue: .x4B)}
    static var c164A84: Color {return Color(red: .x16, green: .x4A, blue: .x84)}
    static var c013574: Color {return Color(red: .x01, green: .x35, blue: .x74)}
    static var c274A78: Color {return Color(red: .x27, green: .x4A, blue: .x78)}
    static var c19448E: Color {return Color(red: .x19, green: .x44, blue: .x8E)}
    static var c223A70: Color {return Color(red: .x22, green: .x3A, blue: .x70)}
    static var c2A4073: Color {return Color(red: .x2A, green: .x40, blue: .x73)}
    static var c213380: Color {return Color(red: .x21, green: .x33, blue: .x80)}
    static var c392680: Color {return Color(red: .x39, green: .x26, blue: .x80)}
    static var c223D5F: Color {return Color(red: .x22, green: .x3D, blue: .x5F)}
    static var c1E3859: Color {return Color(red: .x1E, green: .x38, blue: .x59)}
    static var c192F60: Color {return Color(red: .x19, green: .x2F, blue: .x60)}
    static var c1C305C: Color {return Color(red: .x1C, green: .x30, blue: .x5C)}
    static var c1F2F54: Color {return Color(red: .x1F, green: .x2F, blue: .x54)}
    static var c698AAB: Color {return Color(red: .x69, green: .x8A, blue: .xAB)}
    static var c68699B: Color {return Color(red: .x68, green: .x69, blue: .x9B)}
    static var c4A488E: Color {return Color(red: .x4A, green: .x48, blue: .x8E)}
    static var c706CAA: Color {return Color(red: .x70, green: .x6C, blue: .xAA)}
    static var c7A71A2: Color {return Color(red: .x7A, green: .x71, blue: .xA2)}
    static var c867BA9: Color {return Color(red: .x86, green: .x7B, blue: .xA9)}
    static var c84A2D4: Color {return Color(red: .x84, green: .xA2, blue: .xD4)}
    static var c8491C3: Color {return Color(red: .x84, green: .x91, blue: .xC3)}
    static var c9093E0: Color {return Color(red: .x90, green: .x93, blue: .xE0)}
    static var cA59ACA: Color {return Color(red: .xA5, green: .x9A, blue: .xCA)}
    static var cA69ABD: Color {return Color(red: .xA6, green: .x9A, blue: .xBD)}
    static var cC0A2C7: Color {return Color(red: .xC0, green: .xA2, blue: .xC7)}
    static var c9079AD: Color {return Color(red: .x90, green: .x79, blue: .xAD)}
    static var c775580: Color {return Color(red: .x77, green: .x55, blue: .x80)}
    static var c895B8A: Color {return Color(red: .x89, green: .x5B, blue: .x8A)}
    static var c573E6D: Color {return Color(red: .x57, green: .x3E, blue: .x6D)}
    static var c522F60: Color {return Color(red: .x52, green: .x2F, blue: .x60)}
    static var c5D2369: Color {return Color(red: .x5D, green: .x23, blue: .x69)}
    static var c55295B: Color {return Color(red: .x55, green: .x29, blue: .x5B)}
    static var c65318E: Color {return Color(red: .x65, green: .x31, blue: .x8E)}
    static var c7058A3: Color {return Color(red: .x70, green: .x58, blue: .xA3)}
    static var c674598: Color {return Color(red: .x67, green: .x45, blue: .x98)}
    static var c674196: Color {return Color(red: .x67, green: .x41, blue: .x96)}
    static var c745399: Color {return Color(red: .x74, green: .x53, blue: .x99)}
    static var c744F97: Color {return Color(red: .x74, green: .x4F, blue: .x97)}
    static var cA15DC4: Color {return Color(red: .xA1, green: .x5D, blue: .xC4)}
    static var c884898: Color {return Color(red: .x88, green: .x48, blue: .x98)}
    static var c9A5FA9: Color {return Color(red: .x9A, green: .x5F, blue: .xA9)}
    static var cE5ABBE: Color {return Color(red: .xE5, green: .xAB, blue: .xBE)}
    static var cEEBBCB: Color {return Color(red: .xEE, green: .xBB, blue: .xCB)}
    static var cE597B2: Color {return Color(red: .xE5, green: .x97, blue: .xB2)}
    static var cE7609E: Color {return Color(red: .xE7, green: .x60, blue: .x9E)}
    static var cE95295: Color {return Color(red: .xE9, green: .x52, blue: .x95)}
    static var cF85CA2: Color {return Color(red: .xF8, green: .x5C, blue: .xA2)}
    static var cEB6EA5: Color {return Color(red: .xEB, green: .x6E, blue: .xA5)}
    static var cF73B70: Color {return Color(red: .xF7, green: .x3B, blue: .x70)}
    static var cD7003A: Color {return Color(red: .xD7, green: .x00, blue: .x3A)}
    static var c9D5B8B: Color {return Color(red: .x9D, green: .x5B, blue: .x8B)}
    static var cBC64A4: Color {return Color(red: .xBC, green: .x64, blue: .xA4)}
    static var cAA4C8F: Color {return Color(red: .xAA, green: .x4C, blue: .x8F)}
    static var cB44C97: Color {return Color(red: .xB4, green: .x4C, blue: .x97)}
    static var cC85179: Color {return Color(red: .xC8, green: .x51, blue: .x79)}
    static var c460E44: Color {return Color(red: .x46, green: .x0E, blue: .x44)}
    static var c550B41: Color {return Color(red: .x55, green: .x0B, blue: .x41)}
    static var c61065E: Color {return Color(red: .x61, green: .x06, blue: .x5E)}
    static var c6B1349: Color {return Color(red: .x6B, green: .x13, blue: .x49)}
    static var c640125: Color {return Color(red: .x64, green: .x01, blue: .x25)}
    static var c5B2856: Color {return Color(red: .x5B, green: .x28, blue: .x56)}
    static var c7A4171: Color {return Color(red: .x7A, green: .x41, blue: .x71)}
    static var c74325C: Color {return Color(red: .x74, green: .x32, blue: .x5C)}
    static var c824880: Color {return Color(red: .x82, green: .x48, blue: .x80)}
    static var c915C8B: Color {return Color(red: .x91, green: .x5C, blue: .x8B)}
    static var cA46A92: Color {return Color(red: .xA4, green: .x6A, blue: .x92)}
    static var c8C6278: Color {return Color(red: .x8C, green: .x62, blue: .x78)}
    static var c785863: Color {return Color(red: .x78, green: .x58, blue: .x63)}
    static var cCCA6BF: Color {return Color(red: .xCC, green: .xA6, blue: .xBF)}
    static var cCC7EB1: Color {return Color(red: .xCC, green: .x7E, blue: .xB1)}
    static var cE198B4: Color {return Color(red: .xE1, green: .x98, blue: .xB4)}
    static var cFFFFFF: Color {return Color(red: .xFF, green: .xFF, blue: .xFF)}
    static var cFFFFFC: Color {return Color(red: .xFF, green: .xFF, blue: .xFC)}
    static var cFEF4F4: Color {return Color(red: .xFE, green: .xF4, blue: .xF4)}
    static var cF8FBF8: Color {return Color(red: .xF8, green: .xFB, blue: .xF8)}
    static var cF7FCFE: Color {return Color(red: .xF7, green: .xFC, blue: .xFE)}
    static var cFBFAF5: Color {return Color(red: .xFB, green: .xFA, blue: .xF5)}
    static var cFFFFF1: Color {return Color(red: .xFF, green: .xFF, blue: .xF1)}
    static var cF6FBF6: Color {return Color(red: .xF6, green: .xFB, blue: .xF6)}
    static var cFDEFF2: Color {return Color(red: .xFD, green: .xEF, blue: .xF2)}
    static var cF3F3F3: Color {return Color(red: .xF3, green: .xF3, blue: .xF3)}
    static var cF3F3F2: Color {return Color(red: .xF3, green: .xF3, blue: .xF2)}
    static var cEAF4FC: Color {return Color(red: .xEA, green: .xF4, blue: .xFC)}
    static var cF8F4E6: Color {return Color(red: .xF8, green: .xF4, blue: .xE6)}
    static var cEBF6F7: Color {return Color(red: .xEB, green: .xF6, blue: .xF7)}
    static var cEAEDF7: Color {return Color(red: .xEA, green: .xED, blue: .xF7)}
    static var cE9EEF3: Color {return Color(red: .xE9, green: .xEE, blue: .xF3)}
    static var cE8ECEF: Color {return Color(red: .xE8, green: .xEC, blue: .xEF)}
    static var cEBF3DC: Color {return Color(red: .xEB, green: .xF3, blue: .xDC)}
    static var cDEF3DE: Color {return Color(red: .xDE, green: .xF3, blue: .xDE)}
    static var cE7E7EB: Color {return Color(red: .xE7, green: .xE7, blue: .xEB)}
    static var cEFE0E8: Color {return Color(red: .xEF, green: .xE0, blue: .xE8)}
    static var cEAE5E3: Color {return Color(red: .xEA, green: .xE5, blue: .xE3)}
    static var cE6EAE3: Color {return Color(red: .xE6, green: .xEA, blue: .xE3)}
    static var cE5E4E6: Color {return Color(red: .xE5, green: .xE4, blue: .xE6)}
    static var cEDE9D8: Color {return Color(red: .xED, green: .xE9, blue: .xD8)}
    static var cE9DFE5: Color {return Color(red: .xE9, green: .xDF, blue: .xE5)}
    static var cF3CCCC: Color {return Color(red: .xF3, green: .xCC, blue: .xCC)}
    static var cE7DCD3: Color {return Color(red: .xE7, green: .xDC, blue: .xD3)}
    static var cEDE4CD: Color {return Color(red: .xED, green: .xE4, blue: .xCD)}
    static var cE9E4D4: Color {return Color(red: .xE9, green: .xE4, blue: .xD4)}
    static var cDADFE0: Color {return Color(red: .xDA, green: .xDF, blue: .xE0)}
    static var cE8D3D1: Color {return Color(red: .xE8, green: .xD3, blue: .xD1)}
    static var cDCDDDD: Color {return Color(red: .xDC, green: .xDD, blue: .xDD)}
    static var cDBD0E6: Color {return Color(red: .xDB, green: .xD0, blue: .xE6)}
    static var cE4D2D8: Color {return Color(red: .xE4, green: .xD2, blue: .xD8)}
    static var cDDDCD6: Color {return Color(red: .xDD, green: .xDC, blue: .xD6)}
    static var cD6E9CA: Color {return Color(red: .xD6, green: .xE9, blue: .xCA)}
    static var cD4DCD6: Color {return Color(red: .xD4, green: .xDC, blue: .xD6)}
    static var cD4DCDA: Color {return Color(red: .xD4, green: .xDC, blue: .xDA)}
    static var cE6CDE3: Color {return Color(red: .xE6, green: .xCD, blue: .xE3)}
    static var cDCD6D9: Color {return Color(red: .xDC, green: .xD6, blue: .xD9)}
    static var cE8D3C7: Color {return Color(red: .xE8, green: .xD3, blue: .xC7)}
    static var cC1E4E9: Color {return Color(red: .xC1, green: .xE4, blue: .xE9)}
    static var cD3CFD9: Color {return Color(red: .xD3, green: .xCF, blue: .xD9)}
    static var cD3CCD6: Color {return Color(red: .xD3, green: .xCC, blue: .xD6)}
    static var cD3CBC6: Color {return Color(red: .xD3, green: .xCB, blue: .xC6)}
    static var cCBCDCD: Color {return Color(red: .xCB, green: .xCD, blue: .xCD)}
    static var cBBBCDE: Color {return Color(red: .xBB, green: .xBC, blue: .xDE)}
    static var cBED3CA: Color {return Color(red: .xBE, green: .xD3, blue: .xCA)}
    static var cC8D5BB: Color {return Color(red: .xC8, green: .xD5, blue: .xBB)}
    static var cBED2C3: Color {return Color(red: .xBE, green: .xD2, blue: .xC3)}
    static var cC5C5C7: Color {return Color(red: .xC5, green: .xC5, blue: .xC7)}
    static var cC0C6C9: Color {return Color(red: .xC0, green: .xC6, blue: .xC9)}
    static var cC8C2C6: Color {return Color(red: .xC8, green: .xC2, blue: .xC6)}
    static var cC8C2BE: Color {return Color(red: .xC8, green: .xC2, blue: .xBE)}
    static var cB5C0C9: Color {return Color(red: .xB5, green: .xC0, blue: .xC9)}
    static var cA6C8B2: Color {return Color(red: .xA6, green: .xC8, blue: .xB2)}
    static var cA6A5C4: Color {return Color(red: .xA6, green: .xA5, blue: .xC4)}
    static var cC4A3BF: Color {return Color(red: .xC4, green: .xA3, blue: .xBF)}
    static var cAFAFB0: Color {return Color(red: .xAF, green: .xAF, blue: .xB0)}
    static var cADADAD: Color {return Color(red: .xAD, green: .xAD, blue: .xAD)}
    static var cB3ADA0: Color {return Color(red: .xB3, green: .xAD, blue: .xA0)}
    static var cA3A3A2: Color {return Color(red: .xA3, green: .xA3, blue: .xA2)}
    static var cA89DAC: Color {return Color(red: .xA8, green: .x9D, blue: .xAC)}
    static var cA0A0A0: Color {return Color(red: .xA0, green: .xA0, blue: .xA0)}
    static var c9FA0A0: Color {return Color(red: .x9F, green: .xA0, blue: .xA0)}
    static var c97ABAC: Color {return Color(red: .x97, green: .xAB, blue: .xAC)}
    static var c9EA1A3: Color {return Color(red: .x9E, green: .xA1, blue: .xA3)}
    static var cA99E93: Color {return Color(red: .xA9, green: .x9E, blue: .x93)}
    static var c9BA88D: Color {return Color(red: .x9B, green: .xA8, blue: .x8D)}
    static var c97A791: Color {return Color(red: .x97, green: .xA7, blue: .x91)}
    static var c929FA7: Color {return Color(red: .x92, green: .x9F, blue: .xA7)}
    static var c8E9AAB: Color {return Color(red: .x8E, green: .x9A, blue: .xAB)}
    static var c9790A4: Color {return Color(red: .x97, green: .x90, blue: .xA4)}
    static var c9792A0: Color {return Color(red: .x97, green: .x92, blue: .xA0)}
    static var c9D92A0: Color {return Color(red: .x9D, green: .x92, blue: .xA0)}
    static var c95949A: Color {return Color(red: .x95, green: .x94, blue: .x9A)}
    static var c9E8B8E: Color {return Color(red: .x9E, green: .x8B, blue: .x8E)}
    static var c949495: Color {return Color(red: .x94, green: .x94, blue: .x95)}
    static var c8B968D: Color {return Color(red: .x8B, green: .x96, blue: .x8D)}
    static var c90879A: Color {return Color(red: .x90, green: .x87, blue: .x9A)}
    static var c95859C: Color {return Color(red: .x95, green: .x85, blue: .x9C)}
    static var c9D8682: Color {return Color(red: .x9D, green: .x86, blue: .x82)}
    static var c988F86: Color {return Color(red: .x98, green: .x8F, blue: .x86)}
    static var c888E7E: Color {return Color(red: .x88, green: .x8E, blue: .x7E)}
    static var c888084: Color {return Color(red: .x88, green: .x80, blue: .x84)}
    static var c887F7A: Color {return Color(red: .x88, green: .x7F, blue: .x7A)}
    static var c7D7D7D: Color {return Color(red: .x7D, green: .x7D, blue: .x7D)}
    static var c7B7C7D: Color {return Color(red: .x7B, green: .x7C, blue: .x7D)}
    static var c836D6D: Color {return Color(red: .x83, green: .x6D, blue: .x6D)}
    static var c727171: Color {return Color(red: .x72, green: .x71, blue: .x71)}
    static var c767C6B: Color {return Color(red: .x76, green: .x7C, blue: .x6B)}
    static var c6B7B6E: Color {return Color(red: .x6B, green: .x7B, blue: .x6E)}
    static var c776F76: Color {return Color(red: .x77, green: .x6F, blue: .x76)}
    static var c746B6B: Color {return Color(red: .x74, green: .x6B, blue: .x6B)}
    static var c7C6C66: Color {return Color(red: .x7C, green: .x6C, blue: .x66)}
    static var c716F68: Color {return Color(red: .x71, green: .x6F, blue: .x68)}
    static var c787661: Color {return Color(red: .x78, green: .x76, blue: .x61)}
    static var c71686C: Color {return Color(red: .x71, green: .x68, blue: .x6C)}
    static var c5D5D74: Color {return Color(red: .x5D, green: .x5D, blue: .x74)}
    static var c705B67: Color {return Color(red: .x70, green: .x5B, blue: .x67)}
    static var c725B63: Color {return Color(red: .x72, green: .x5B, blue: .x63)}
    static var c6B6F59: Color {return Color(red: .x6B, green: .x6F, blue: .x59)}
    static var c5F7058: Color {return Color(red: .x5F, green: .x70, blue: .x58)}
    static var c526F55: Color {return Color(red: .x52, green: .x6F, blue: .x55)}
    static var c57696D: Color {return Color(red: .x57, green: .x69, blue: .x6D)}
    static var c57645A: Color {return Color(red: .x57, green: .x64, blue: .x5A)}
    static var c5B6356: Color {return Color(red: .x5B, green: .x63, blue: .x56)}
    static var c595857: Color {return Color(red: .x59, green: .x58, blue: .x57)}
    static var c5B634E: Color {return Color(red: .x5B, green: .x63, blue: .x4E)}
    static var c595455: Color {return Color(red: .x59, green: .x54, blue: .x55)}
    static var c635C48: Color {return Color(red: .x63, green: .x5C, blue: .x48)}
    static var c4D4C61: Color {return Color(red: .x4D, green: .x4C, blue: .x61)}
    static var c5A5359: Color {return Color(red: .x5A, green: .x53, blue: .x59)}
    static var c634950: Color {return Color(red: .x63, green: .x49, blue: .x50)}
    static var c635B44: Color {return Color(red: .x63, green: .x5B, blue: .x44)}
    static var c455765: Color {return Color(red: .x45, green: .x57, blue: .x65)}
    static var c61485B: Color {return Color(red: .x61, green: .x48, blue: .x5B)}
    static var c5A544B: Color {return Color(red: .x5A, green: .x54, blue: .x4B)}
    static var c56564B: Color {return Color(red: .x56, green: .x56, blue: .x4B)}
    static var c485859: Color {return Color(red: .x48, green: .x58, blue: .x59)}
    static var c47585C: Color {return Color(red: .x47, green: .x58, blue: .x5C)}
    static var c4F455C: Color {return Color(red: .x4F, green: .x45, blue: .x5C)}
    static var c524E4D: Color {return Color(red: .x52, green: .x4E, blue: .x4D)}
    static var c555647: Color {return Color(red: .x55, green: .x56, blue: .x47)}
    static var c475950: Color {return Color(red: .x47, green: .x59, blue: .x50)}
    static var c5F414B: Color {return Color(red: .x5F, green: .x41, blue: .x4B)}
    static var c524748: Color {return Color(red: .x52, green: .x47, blue: .x48)}
    static var c544A47: Color {return Color(red: .x54, green: .x4A, blue: .x47)}
    static var c3E5C54: Color {return Color(red: .x3E, green: .x5C, blue: .x54)}
    static var c594255: Color {return Color(red: .x59, green: .x42, blue: .x55)}
    static var c415546: Color {return Color(red: .x41, green: .x55, blue: .x46)}
    static var c3A5B52: Color {return Color(red: .x3A, green: .x5B, blue: .x52)}
    static var c474A4D: Color {return Color(red: .x47, green: .x4A, blue: .x4D)}
    static var c454550: Color {return Color(red: .x45, green: .x45, blue: .x50)}
    static var c554738: Color {return Color(red: .x55, green: .x47, blue: .x38)}
    static var c474B42: Color {return Color(red: .x47, green: .x4B, blue: .x42)}
    static var c3C5245: Color {return Color(red: .x3C, green: .x52, blue: .x45)}
    static var c493759: Color {return Color(red: .x49, green: .x37, blue: .x59)}
    static var c494A41: Color {return Color(red: .x49, green: .x4A, blue: .x41)}
    static var c3F4D41: Color {return Color(red: .x3F, green: .x4D, blue: .x41)}
    static var c393E4F: Color {return Color(red: .x39, green: .x3E, blue: .x4F)}
    static var c404048: Color {return Color(red: .x40, green: .x40, blue: .x48)}
    static var c513743: Color {return Color(red: .x51, green: .x37, blue: .x43)}
    static var c543F32: Color {return Color(red: .x54, green: .x3F, blue: .x32)}
    static var c3E4346: Color {return Color(red: .x3E, green: .x43, blue: .x46)}
    static var c393F4C: Color {return Color(red: .x39, green: .x3F, blue: .x4C)}
    static var c3F3F3F: Color {return Color(red: .x3F, green: .x3F, blue: .x3F)}
    static var c433D3C: Color {return Color(red: .x43, green: .x3D, blue: .x3C)}
    static var c384D31: Color {return Color(red: .x38, green: .x4D, blue: .x31)}
    static var c354D4B: Color {return Color(red: .x35, green: .x4D, blue: .x4B)}
    static var c4B4B31: Color {return Color(red: .x4B, green: .x4B, blue: .x31)}
    static var c49492B: Color {return Color(red: .x49, green: .x49, blue: .x2B)}
    static var c37413D: Color {return Color(red: .x37, green: .x41, blue: .x3D)}
    static var c383C3C: Color {return Color(red: .x38, green: .x3C, blue: .x3C)}
    static var c2D3446: Color {return Color(red: .x2D, green: .x34, blue: .x46)}
    static var c432F2F: Color {return Color(red: .x43, green: .x2F, blue: .x2F)}
    static var c2A443D: Color {return Color(red: .x2A, green: .x44, blue: .x3D)}
    static var c492741: Color {return Color(red: .x49, green: .x27, blue: .x41)}
    static var c3F312B: Color {return Color(red: .x3F, green: .x31, blue: .x2B)}
    static var c333631: Color {return Color(red: .x33, green: .x36, blue: .x31)}
    static var c203744: Color {return Color(red: .x20, green: .x37, blue: .x44)}
    static var c2E382A: Color {return Color(red: .x2E, green: .x38, blue: .x2A)}
    static var c2D2D2D: Color {return Color(red: .x2D, green: .x2D, blue: .x2D)}
    static var c302833: Color {return Color(red: .x30, green: .x28, blue: .x33)}
    static var c2B2B2B: Color {return Color(red: .x2B, green: .x2B, blue: .x2B)}
    static var c28282E: Color {return Color(red: .x28, green: .x28, blue: .x2E)}
    static var c2E2930: Color {return Color(red: .x2E, green: .x29, blue: .x30)}
    static var c1F3134: Color {return Color(red: .x1F, green: .x31, blue: .x34)}
    static var c2D252D: Color {return Color(red: .x2D, green: .x25, blue: .x2D)}
    static var c2A2223: Color {return Color(red: .x2A, green: .x22, blue: .x23)}
    static var c331818: Color {return Color(red: .x33, green: .x18, blue: .x18)}
    static var c351916: Color {return Color(red: .x35, green: .x19, blue: .x16)}
    static var c183335: Color {return Color(red: .x18, green: .x33, blue: .x35)}
    static var c331936: Color {return Color(red: .x33, green: .x19, blue: .x36)}
    static var c252424: Color {return Color(red: .x25, green: .x24, blue: .x24)}
    static var c252020: Color {return Color(red: .x25, green: .x20, blue: .x20)}
    static var c29221D: Color {return Color(red: .x29, green: .x22, blue: .x1D)}
    static var c2E2713: Color {return Color(red: .x2E, green: .x27, blue: .x13)}
    static var c20231F: Color {return Color(red: .x20, green: .x23, blue: .x1F)}
    static var c281A14: Color {return Color(red: .x28, green: .x1A, blue: .x14)}
    static var c1F1F19: Color {return Color(red: .x1F, green: .x1F, blue: .x19)}
    static var c251219: Color {return Color(red: .x25, green: .x12, blue: .x19)}
    static var c1A1A19: Color {return Color(red: .x1A, green: .x1A, blue: .x19)}
    static var c0D270D: Color {return Color(red: .x0D, green: .x27, blue: .x0D)}
    static var c1E1222: Color {return Color(red: .x1E, green: .x12, blue: .x22)}
    static var c270809: Color {return Color(red: .x27, green: .x08, blue: .x09)}
    static var c241A08: Color {return Color(red: .x24, green: .x1A, blue: .x08)}
    static var c171917: Color {return Color(red: .x17, green: .x19, blue: .x17)}
    static var c171310: Color {return Color(red: .x17, green: .x13, blue: .x10)}
    static var c250D00: Color {return Color(red: .x25, green: .x0D, blue: .x00)}
    static var c16160E: Color {return Color(red: .x16, green: .x16, blue: .x0E)}
    static var c180614: Color {return Color(red: .x18, green: .x06, blue: .x14)}
    static var c0D0D0D: Color {return Color(red: .x0D, green: .x0D, blue: .x0D)}
    static var c15050A: Color {return Color(red: .x15, green: .x05, blue: .x0A)}
    static var c0D0015: Color {return Color(red: .x0D, green: .x00, blue: .x15)}
    static var c12020E: Color {return Color(red: .x12, green: .x02, blue: .x0E)}
    static var c000B00: Color {return Color(red: .x00, green: .x0B, blue: .x00)}
}
