//
//  Person.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/16.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation
class Father: NSObject {
    var family: String = ""
    static var v1: Int = 1
    
    @objc public func sn1() -> Int { return 1 }
    @objc func sn2(i: Int) -> Int { return i }
    func sn3(i: Int) -> Int { return i }
    class func sn4() -> Int { return 11 }
    static func sn5() -> Int { return 12 }
}

@objc(Son2)
class Son2: Father {
    let name: String = ""
    let first: String = ""
    @objc var age: Int = 0
    
    @objc public func fn1() -> Int { return 1 }
    @objc func fn2(i: Int) -> Int { return i }
    func fn3(i: Int) -> Int { return i }
    class func fn4() -> Int { return 11 }
    static func fn5() -> Int { return 12 }
}
