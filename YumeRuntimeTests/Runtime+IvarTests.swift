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
    
    //        var family: String = "v_family"
    //        static var v1: Int = 1
    func testFatherIvar() {
        let v1 = father.ivar.class(name: "v1")
        XCTAssertNil(v1)
        
        let family = father.ivar.instance(name: "family")
        XCTAssertEqual(family?.name, "family")
        XCTAssertEqual(family?.typeEncoding, "")
        XCTAssertEqual(family?.offset, 8)
    }
    
    //        let name: String = "v_name"
    //        let first: String = "v_first"
    //        @objc var age: Int = 18
    func testSonIvar() {
        let name = son.ivar.instance(name: "name")
        XCTAssertEqual(name?.name, "name")
        XCTAssertEqual(name?.typeEncoding, "")
        XCTAssertEqual(name?.offset, 24)
        
        let first = son.ivar.instance(name: "first")
        XCTAssertEqual(first?.name, "first")
        XCTAssertEqual(first?.typeEncoding, "")
        XCTAssertEqual(first?.offset, 40)
        
        let age = son.ivar.instance(name: "age")
        XCTAssertEqual(age?.name, "age")
        XCTAssertEqual(age?.typeEncoding, "")
        XCTAssertEqual(age?.offset, 56)
    }
    
    /// work on runtime class
    func testAddIvar() {
        let i = MemoryLayout<Int>.self
        guard let _class: AnyObject.Type = objc_allocateClassPair(NSObject.self, "Yume", 0) else {
            assertionFailure()
            return
        }
        
        
        let rt = Runtime<AnyObject>.init(any: _class)
        let result = rt.ivar.add(name: "_yume", size: i.size, alignmemt: UInt8(i.alignment), types: "i")

        XCTAssertTrue(result)

        let yume = rt.ivar.instance(name: "_yume")
        XCTAssertNotNil(yume)
    }

    func testIvars() {
        // var family: String
        XCTAssertEqual(father.ivar.list.count, 1)
        // let name: String = ""
        // let first: String = ""
        // var age: Int = 0
        XCTAssertEqual(son.ivar.list.count, 3)
    }
    
//    func testIvarLayout() {
//        XCTAssertNotNil(father.ivar.layout)
//        XCTAssertNotNil(son.ivar.layout)
//    }
//    
//    func testWeakIvarLayout() {
//        XCTAssertNotNil(father.ivar.weakLayout)
//        XCTAssertNotNil(son.ivar.weakLayout)
//    }
}
