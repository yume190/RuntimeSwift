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


class Runtime_MethodSwizzleTests: XCTestCase {
    let rSupport = Runtime(MutateSupport.self)
    let target = MutateTarget()
    lazy var rTarget = Runtime(self.target)
    let selTypeEncode = "q24@0:8q16"
    
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

}
