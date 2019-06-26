//
//  Runtime+ProtocolTests.swift
//  YumeRuntimeTests
//
//  Created by Yume on 2018/12/3.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

import XCTest
@testable import YumeRuntime

protocol SwiftProtocol {}
@objc protocol ObjcProtocol {}

class Runtime_ProtocolTests: XCTestCase {
    let rSon = Runtime(Son.self)
    
    let swiftProtocol = Runtime<Son>.get(protocol: "YumeRuntimeTests.SwiftProtocol")
    let objcProtocol = Runtime<Son>.get(protocol: "YumeRuntimeTests.ObjcProtocol")
    
    func testGetProtocol() {
        XCTAssertTrue(swiftProtocol == nil)
        XCTAssertTrue(objcProtocol != nil)
    }
    
    func testAddProtocol() {
        XCTAssertEqual(rSon.classProtocols.count, 0)
        XCTAssertFalse(rSon.isConformsTo(protocol: objcProtocol!))
        
        XCTAssertTrue(rSon.add(protocol: objcProtocol!))
        
        XCTAssertEqual(rSon.classProtocols.count, 1)
        XCTAssertTrue(rSon.isConformsTo(protocol: objcProtocol!))
    }
    
    /// ??
    func testAllProtocol() {
        let ps = Runtime<Son>.allRuntimeProtocols
        XCTAssertEqual(ps.count, 937)
    }
}
