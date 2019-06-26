//
//  Runtime+MethodTests.swift
//  YumeRuntimeTests
//
//  Created by Yume on 2018/11/29.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

import XCTest
@testable import YumeRuntime

class Runtime_MethodTests: XCTestCase {
    
    let son_fn1 = #selector(Son.fn1)
    let son_fn2 = #selector(Son.fn2(i:))
    
    func testImp1() {
        let fn1Imp = son.method.imp(selector: son_fn1)!
        let fn1: @convention(c) (AnyObject, Selector) -> Int = fn1Imp.cast()
        XCTAssertEqual(fn1(Son(), son_fn1), 1)
    }
    
    func testImp2() {
        let fn2Imp = son.method.imp(selector: son_fn2)!
        let fn2: @convention(c) (AnyObject, Selector, Int) -> Int = fn2Imp.cast()
        XCTAssertEqual(fn2(Son(), son_fn2, 2), 2)
    }
    
    func testImpStret1() {
        let fn1Imp = son.method.impStret(selector: son_fn1)!
        let fn1: @convention(c) (AnyObject, Selector) -> Int = fn1Imp.cast()
        XCTAssertEqual(fn1(Son(), son_fn1), 1)
    }

    func testImpStret2() {
        let fn2Imp = son.method.impStret(selector: son_fn2)!
        let fn2: @convention(c) (AnyObject, Selector, Int) -> Int = fn2Imp.cast()
        XCTAssertEqual(fn2(Son(), son_fn2, 2), 2)
    }

    func testIsRespondsTo() {
        XCTAssertTrue(son.method.isRespondsTo(selector: son_fn1))
        XCTAssertTrue(son.method.isRespondsTo(selector: son_fn2))
    }
    
    func testMethods() {
        // sn1 q16@0:8
        // sn2WithI: q24@0:8q16
        // init @16@0:8
        // .cxx_destruct v16@0:8
        XCTAssertEqual(father.methods.count, 4)
        // fn2WithI: q24@0:8q16
        // fn1 q16@0:8
        // init @16@0:8
        // .cxx_destruct v16@0:8
        // age q16@0:8
        // setAge: v24@0:8q16
        XCTAssertEqual(son.methods.count, 6)
    }
    
    func testInstanceMethod() {
        let imp = son.method.instance(name: son_fn1)?.imp
        let fn: @convention(c) (AnyObject, Selector) -> Int = imp!.cast()
        XCTAssertEqual(fn(Son(), son_fn1), 1)
    }
    
    func testClassMethod() {
        let impFn4 = son.method.class(name: #selector(Son.fn4))?.imp
        let fn4: @convention(c) (AnyObject, Selector) -> Int = impFn4!.cast()
        XCTAssertEqual(fn4(Son(), #selector(Son.fn4)), 11)
        
        let impFn5 = son.method.class(name: #selector(Son.fn5))?.imp
        let fn5: @convention(c) (AnyObject, Selector) -> Int = impFn5!.cast()
        XCTAssertEqual(fn5(Son(), #selector(Son.fn5)), 12)
    }
}

// MARK: Type Encode
extension Runtime_MethodTests {
    /// q24@0:8q16
    /// @objc func fn2(i: Int) -> Int { return i }
    /// q long long
    /// @ id
    /// : SEL
    func testEncode() {
        let method = son.method.instance(name: son_fn2)
        
        XCTAssertEqual(method?.argumentsCount, 3)
        
        XCTAssertEqual(method?.typeEncoding, "q24@0:8q16")
        XCTAssertEqual(method?.copyReturnType, "q")
        XCTAssertEqual(method?.getReturnType, "q")
        XCTAssertEqual(method?.copyArgumentType(index: 0), "@")
        XCTAssertEqual(method?.getArgumentType(index: 0), "@")
        
        XCTAssertEqual(method?.copyArgumentType(index: 1), ":")
        XCTAssertEqual(method?.getArgumentType(index: 1), ":")
        
        XCTAssertEqual(method?.copyArgumentType(index: 2), "q")
        XCTAssertEqual(method?.getArgumentType(index: 2), "q")

    }
}
