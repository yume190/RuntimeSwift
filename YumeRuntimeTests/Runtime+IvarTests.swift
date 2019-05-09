//
//  File.swift
//  YumeRuntimeTests
//
//  Created by Yume on 2018/12/3.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

import XCTest
@testable import YumeRuntime

class Runtime_IvarTests: XCTestCase {
    let rFather = Runtime(Father.self)
    let rSon = Runtime(Son2.self)
    
//    func testAddIvar() {
//          addIvar(name: String, size: Int, alignmemt: UInt8, types: String) -> Bool
//    }

    func testIvars() {
        // var family: String
        XCTAssertEqual(rFather.ivars.count, 1)
        // let name: String = ""
        // let first: String = ""
        // var age: Int = 0
        XCTAssertEqual(rSon.ivars.count, 3)
    }
    
//    func testIvarLayout() {
//        XCTAssertTrue(rFather.ivarLayout != nil)
//        XCTAssertTrue(rSon.ivarLayout != nil)
//    }
    
//    func testWeakIvarLayout() {
//        XCTAssertTrue(rFather.weakIvarLayout != nil)
//        XCTAssertTrue(rSon.weakIvarLayout != nil)
//    }
}
