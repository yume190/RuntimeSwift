//
//  Person.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/16.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation
class Father: NSObject {
    @objc var family: String = ""
    @objc static var v1: Int = 1
}

//@objc(Son)
class Son: Father {
    @objc let name: String = ""
    @objc weak var dad: Father? = nil
    
    @objc public func call(count: Int) -> Int {
//        var a = 1
//        withUnsafePointer(to: &a) {
//            print(" str value \(a) has address: \($0)")
//        }
//        print("dad~ \(count)")
        return count
    }
}
