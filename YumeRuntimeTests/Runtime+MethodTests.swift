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
    let rFather = Runtime(Father.self)
    let son = Son2()
    let rSon = Runtime(Son2.self)
    
    let sel1 = #selector(Son2.fn1)
    let sel2 = #selector(Son2.fn2(i:))
    
    let rSupport = Runtime(MutateSupport.self)
    let target = MutateTarget()
    lazy var rTarget = Runtime(self.target)
    let selTypeEncode = "q24@0:8q16"
    
    func testImp1() {
        let fn1Imp = rSon.imp(selector: sel1)!
        let fn1: @convention(c) (AnyObject, Selector) -> Int = fn1Imp.cast()
        XCTAssertEqual(fn1(son, sel1), 1)
    }
    
    func testImp2() {
        let fn2Imp = rSon.imp(selector: sel2)!
        let fn2: @convention(c) (AnyObject, Selector, Int) -> Int = fn2Imp.cast()
        XCTAssertEqual(fn2(son, sel2, 2), 2)
    }
    
    func testImpStret1() {
        let fn1Imp = rSon.impStret(selector: sel1)!
        let fn1: @convention(c) (AnyObject, Selector) -> Int = fn1Imp.cast()
        XCTAssertEqual(fn1(son, sel1), 1)
    }
    
    func testImpStret2() {
        let fn2Imp = rSon.impStret(selector: sel2)!
        let fn2: @convention(c) (AnyObject, Selector, Int) -> Int = fn2Imp.cast()
        XCTAssertEqual(fn2(son, sel2, 2), 2)
    }
    
    func testIsRespondsTo() {
        XCTAssertTrue(rSon.isRespondsTo(selector: sel1))
        XCTAssertTrue(rSon.isRespondsTo(selector: sel2))
    }
    
    func testMethods() {
        // sn1          "q16@0:8"
        // sn2WithI     "q24@0:8q16"
        // init
        // .cxx_destruct
        XCTAssertEqual(rFather.methods.count, 4)
        XCTAssertEqual(rSon.methods.count, 4)
    }
    
    /// support mn3(+30) add to target
    func testAddMethods() {
        let sel = #selector(MutateSupport.mn3(a:))
        let method = rSupport.instanceMethod(name: sel)!
        let addResult = rTarget.addMethod(name: sel, imp: method.imp, types: selTypeEncode)
        XCTAssertTrue(addResult)
        
        let imp = rTarget.imp(selector: sel)!
        let mn3: @convention(c) (AnyObject, Selector, Int) -> Int = imp.cast()
        XCTAssertEqual(mn3(MutateTarget(), sel, 0), 30)
    }

    // MARK: Need dynamic func
    /// tartet mn1 置換成 mn2(+200)
    func testReplaceMethods() {
        let sel1 = #selector(MutateTarget.mn1(a:))
        let sel2 = #selector(MutateTarget.mn2(a:))
        let method = rTarget.instanceMethod(name: sel2)!
        let replaceResult = rTarget.replaceMethod(name: sel1, imp: method.imp, types: selTypeEncode)
        XCTAssertTrue(replaceResult != nil)
        XCTAssertEqual(target.mn1(a: 0), 200)
        XCTAssertEqual(target.mn2(a: 0), 200)
    }
    
    func testInstanceMethod() {
        let method = rTarget.instanceMethod(name: #selector(MutateTarget.mn1(a:)))
        XCTAssertTrue(method != nil)
    }
    
    func testClassMethod() {
        let cMethod = rTarget.classMethod(name: #selector(MutateTarget.cn1))
        XCTAssertTrue(cMethod != nil)
        
        let sMethod = rTarget.classMethod(name: #selector(MutateTarget.sn1))
        XCTAssertTrue(sMethod != nil)
    }
}

@objc class MutateSupport: NSObject {
    @objc func mn1(a: Int) -> Int {
        return a + 10
    }
    
    @objc func mn2(a: Int) -> Int {
        return a + 20
    }
    
    @objc func mn3(a: Int) -> Int {
        return a + 30
    }
}


@objc class MutateTarget: NSObject {
    @objc class func cn1() {}
    @objc static func sn1() {}
    
    @objc dynamic func mn1(a: Int) -> Int {
        return a + 100
    }
    
    @objc dynamic func mn2(a: Int) -> Int {
        return a + 200
    }
}
