//
//  Person.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/16.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation
@testable import YumeRuntime

class Father: NSObject {
//    public static var f_public_static_var: Int = 1
//    internal static let f_internal_static_let: String = "2"
//    private static var f_private_static_var: Int = 3
//
//    public var f_public_var: Int = 1
//    internal let f_internal_let: String = "2"
//    private final var f_private_final_var: Int = 3
//    internal final var f_internal_final_var: Int = 4
    
    var family: String = "v_family"
    static var v1: Int = 1
    
    @objc public func sn1() -> Int { return 1 }
    @objc func sn2(i: Int) -> Int { return i }
    func sn3(i: Int) -> Int { return i }
    class func sn4() -> Int { return 11 }
    static func sn5() -> Int { return 12 }
}

@objc(Son)
class Son: Father {
    let name: String = "v_name"
    let first: String = "v_first"
    @objc var age: Int = 18

    @objc public func fn1() -> Int { return 1 }
    @objc func fn2(i: Int) -> Int { return i }
    func fn3(i: Int) -> Int { return i }
    @objc class func fn4() -> Int { return 11 }
    @objc static func fn5() -> Int { return 12 }
}

let sonMeta = Runtime(Son.self)
let son = Runtime(Son())
let fatherMeta = Runtime(Father.self)
let father = Runtime(Father())
