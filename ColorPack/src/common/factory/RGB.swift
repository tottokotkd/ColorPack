//
//  RGB.swift
//  ColorPack
//
//  Created by Shusuke Tokuda on 2016/10/23.
//
//

import Foundation

extension ColorFactory {
    public static func rgb(red: RGBKey, green: RGBKey, blue: RGBKey) -> IntRGBColor {
        return Self.create(red: red.rawValue, green: green.rawValue, blue: blue.rawValue)!
    }
}

public enum RGBKey: RGB {
    case d0 = 0
    case d1 = 1
    case d2 = 2
    case d3 = 3
    case d4 = 4
    case d5 = 5
    case d6 = 6
    case d7 = 7
    case d8 = 8
    case d9 = 9
    case d10 = 10
    case d11 = 11
    case d12 = 12
    case d13 = 13
    case d14 = 14
    case d15 = 15
    case d16 = 16
    case d17 = 17
    case d18 = 18
    case d19 = 19
    case d20 = 20
    case d21 = 21
    case d22 = 22
    case d23 = 23
    case d24 = 24
    case d25 = 25
    case d26 = 26
    case d27 = 27
    case d28 = 28
    case d29 = 29
    case d30 = 30
    case d31 = 31
    case d32 = 32
    case d33 = 33
    case d34 = 34
    case d35 = 35
    case d36 = 36
    case d37 = 37
    case d38 = 38
    case d39 = 39
    case d40 = 40
    case d41 = 41
    case d42 = 42
    case d43 = 43
    case d44 = 44
    case d45 = 45
    case d46 = 46
    case d47 = 47
    case d48 = 48
    case d49 = 49
    case d50 = 50
    case d51 = 51
    case d52 = 52
    case d53 = 53
    case d54 = 54
    case d55 = 55
    case d56 = 56
    case d57 = 57
    case d58 = 58
    case d59 = 59
    case d60 = 60
    case d61 = 61
    case d62 = 62
    case d63 = 63
    case d64 = 64
    case d65 = 65
    case d66 = 66
    case d67 = 67
    case d68 = 68
    case d69 = 69
    case d70 = 70
    case d71 = 71
    case d72 = 72
    case d73 = 73
    case d74 = 74
    case d75 = 75
    case d76 = 76
    case d77 = 77
    case d78 = 78
    case d79 = 79
    case d80 = 80
    case d81 = 81
    case d82 = 82
    case d83 = 83
    case d84 = 84
    case d85 = 85
    case d86 = 86
    case d87 = 87
    case d88 = 88
    case d89 = 89
    case d90 = 90
    case d91 = 91
    case d92 = 92
    case d93 = 93
    case d94 = 94
    case d95 = 95
    case d96 = 96
    case d97 = 97
    case d98 = 98
    case d99 = 99
    case d100 = 100
    case d101 = 101
    case d102 = 102
    case d103 = 103
    case d104 = 104
    case d105 = 105
    case d106 = 106
    case d107 = 107
    case d108 = 108
    case d109 = 109
    case d110 = 110
    case d111 = 111
    case d112 = 112
    case d113 = 113
    case d114 = 114
    case d115 = 115
    case d116 = 116
    case d117 = 117
    case d118 = 118
    case d119 = 119
    case d120 = 120
    case d121 = 121
    case d122 = 122
    case d123 = 123
    case d124 = 124
    case d125 = 125
    case d126 = 126
    case d127 = 127
    case d128 = 128
    case d129 = 129
    case d130 = 130
    case d131 = 131
    case d132 = 132
    case d133 = 133
    case d134 = 134
    case d135 = 135
    case d136 = 136
    case d137 = 137
    case d138 = 138
    case d139 = 139
    case d140 = 140
    case d141 = 141
    case d142 = 142
    case d143 = 143
    case d144 = 144
    case d145 = 145
    case d146 = 146
    case d147 = 147
    case d148 = 148
    case d149 = 149
    case d150 = 150
    case d151 = 151
    case d152 = 152
    case d153 = 153
    case d154 = 154
    case d155 = 155
    case d156 = 156
    case d157 = 157
    case d158 = 158
    case d159 = 159
    case d160 = 160
    case d161 = 161
    case d162 = 162
    case d163 = 163
    case d164 = 164
    case d165 = 165
    case d166 = 166
    case d167 = 167
    case d168 = 168
    case d169 = 169
    case d170 = 170
    case d171 = 171
    case d172 = 172
    case d173 = 173
    case d174 = 174
    case d175 = 175
    case d176 = 176
    case d177 = 177
    case d178 = 178
    case d179 = 179
    case d180 = 180
    case d181 = 181
    case d182 = 182
    case d183 = 183
    case d184 = 184
    case d185 = 185
    case d186 = 186
    case d187 = 187
    case d188 = 188
    case d189 = 189
    case d190 = 190
    case d191 = 191
    case d192 = 192
    case d193 = 193
    case d194 = 194
    case d195 = 195
    case d196 = 196
    case d197 = 197
    case d198 = 198
    case d199 = 199
    case d200 = 200
    case d201 = 201
    case d202 = 202
    case d203 = 203
    case d204 = 204
    case d205 = 205
    case d206 = 206
    case d207 = 207
    case d208 = 208
    case d209 = 209
    case d210 = 210
    case d211 = 211
    case d212 = 212
    case d213 = 213
    case d214 = 214
    case d215 = 215
    case d216 = 216
    case d217 = 217
    case d218 = 218
    case d219 = 219
    case d220 = 220
    case d221 = 221
    case d222 = 222
    case d223 = 223
    case d224 = 224
    case d225 = 225
    case d226 = 226
    case d227 = 227
    case d228 = 228
    case d229 = 229
    case d230 = 230
    case d231 = 231
    case d232 = 232
    case d233 = 233
    case d234 = 234
    case d235 = 235
    case d236 = 236
    case d237 = 237
    case d238 = 238
    case d239 = 239
    case d240 = 240
    case d241 = 241
    case d242 = 242
    case d243 = 243
    case d244 = 244
    case d245 = 245
    case d246 = 246
    case d247 = 247
    case d248 = 248
    case d249 = 249
    case d250 = 250
    case d251 = 251
    case d252 = 252
    case d253 = 253
    case d254 = 254
    case d255 = 255
}
