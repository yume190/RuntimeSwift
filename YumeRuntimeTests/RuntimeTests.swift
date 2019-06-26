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
    
    func testClassName() {
        XCTAssertEqual(sonMeta.className, "Son")
        XCTAssertEqual(son.className, "Son")
    }
    
    func testSuperClass() {
        XCTAssertEqual(sonMeta.super?.className, "YumeRuntimeTests.Father")
        XCTAssertEqual(sonMeta.super?.super?.className, "NSObject")
        XCTAssertEqual(sonMeta.super?.super?.super?.className, "NSObject")
    }
    
    func testIsMeta() {
        XCTAssertEqual(sonMeta.isMetaClass, false)
        XCTAssertEqual(sonMeta.meta?.isMetaClass, true)
        
        XCTAssertEqual(son.isMetaClass, false)
        XCTAssertEqual(son.meta?.isMetaClass, true)
    }
    
    
    func testSize() {
        XCTAssertEqual(sonMeta.size, 64)
        XCTAssertEqual(son.size, 64)
        XCTAssertEqual(father.size, 24)
    }
    
    func testVersion() {
        XCTAssertEqual(father.version, 0)
    }
}
