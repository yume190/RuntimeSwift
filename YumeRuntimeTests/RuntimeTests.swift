//
//  RuntimeTests.swift
//  RuntimeTests
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import XCTest
@testable import YumeRuntime

class RuntimeTests: XCTestCase {
    
    
//    let anyObjectClass: AnyObject = Son.self
//    let anyObjectInstance: AnyObject = Son()
////    let a = Runtime(self.anyObjectClass)
    
    
    let son = Runtime(Son2.self)
    let sonObj = Runtime(Son2())
    let father = Runtime(Father.self)
    
//    func testClass() {
//        XCTAssertTrue(son.class! === Son2.self)
//        XCTAssertEqual(sonObj.class, Son2.self)
//        XCTAssertEqual(father.class, Father.self)
//    }
    
    
    
    func testClassName() {
        XCTAssertEqual(son.className, "Son2")
        XCTAssertEqual(sonObj.className, "Son2")
    }
    
    func testSuperClass() {
        XCTAssertEqual(son.super?.className, "YumeRuntimeTests.Father")
        XCTAssertEqual(son.super?.super?.className, "NSObject")
        XCTAssertEqual(son.super?.super?.super?.className, "NSObject")
    }
    
    func testIsMeta() {
        XCTAssertEqual(son.isMetaClass, false)
        XCTAssertEqual(son.meta?.isMetaClass, true)
    }
    
    
    func testSize() {
        XCTAssertEqual(son.size, 64)
        XCTAssertEqual(sonObj.size, 64)
        XCTAssertEqual(father.size, 24)
    }
    
    func testVersion() {
        XCTAssertEqual(father.version, 0)
    }
    
    func testFatherIvar1() {
        XCTAssertEqual(father.instanceVariable(name: "family")?.name, "family")
        XCTAssertEqual(father.instanceVariable(name: "family")?.typeEncoding, "")
        XCTAssertEqual(father.instanceVariable(name: "family")?.offset, 8)
//
//        XCTAssertEqual(father.classVariable(name: "v1")?.name, "v1")
//        XCTAssertEqual(father.classVariable(name: "v1")?.typeEncoding, "")
//        XCTAssertEqual(father.classVariable(name: "v1")?.offset, 16)
    }
    
    func testFatherIvar2() {
        XCTAssertEqual(son.instanceVariable(name: "family")?.name, "family")
        XCTAssertEqual(son.instanceVariable(name: "family")?.typeEncoding, "")
        XCTAssertEqual(son.instanceVariable(name: "family")?.offset, 8)
        
//        XCTAssertEqual(son.classVariable(name: "v1")?.name, "v1")
//        XCTAssertEqual(son.classVariable(name: "v1")?.typeEncoding, "")
//        XCTAssertEqual(son.classVariable(name: "v1")?.offset, 16)
    }
    
    func testSonIvar() {
        XCTAssertEqual(son.instanceVariable(name: "name")?.name, "name")
        XCTAssertEqual(son.instanceVariable(name: "name")?.typeEncoding, "")
        XCTAssertEqual(son.instanceVariable(name: "name")?.offset, 24)
        
        XCTAssertEqual(son.instanceVariable(name: "first")?.name, "first")
        XCTAssertEqual(son.instanceVariable(name: "first")?.typeEncoding, "")
        XCTAssertEqual(son.instanceVariable(name: "first")?.offset, 40)
        
        XCTAssertEqual(son.instanceVariable(name: "age")?.name, "age")
        XCTAssertEqual(son.instanceVariable(name: "age")?.typeEncoding, "")
        XCTAssertEqual(son.instanceVariable(name: "age")?.offset, 56)
    }
}
