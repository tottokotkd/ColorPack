import Foundation

protocol Basic {
    associatedtype T
    var value: T {get}
}

protocol IntBasic: Basic {
    var value: Int {get}
}

protocol IntBasicFactory {
    static func create() -> IntBasic
}
extension IntBasicFactory {
    static func create() -> IntBasica {
        return IntStruct()
    }
}

struct IntStruct: IntBasic, IntBasicFactory {
    let value: Int = 10
//    let value: T = "10"

}

let hoge = IntStruct()
hoge.value
