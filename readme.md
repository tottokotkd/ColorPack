# Swift Color Pack
swift color utility & library

## 1. GET
1. add ColorPack to `Cartfile`
    ```
    github "tottokotkd/ColorPack" "2.2.1"
    ```
2. `carthage update`

## 2. HOW TO USE
please check ColorPack.playground

## 3. LICENSE
MIT

## 4. VERSION
### 2.2
* rename: 'toTriad' -> 'toTriadic'

### 2.1
* ratio merge (experimental)

### 2.0
* totally remade
* 'Double RGB' remains, but **Percentage parameters are FROM 0% to 100% (NOT 0.0 to 1.0)** 
* HSL Color data introduced
* color conversion available (HSL ONLY)
* experimental: calculation, manipulation, operators and tvOS / watchOS support 

### 1.1
* RGB can be specified with Double values
* 'Color' struct is removed: `Color.init?()` is changed to `Color.create()`
* factory methods renamed: , `Color.RGB`, `.Hex` and `.WebSafe` are changed to `.rgb`, `.hex`, `.webSafe`
