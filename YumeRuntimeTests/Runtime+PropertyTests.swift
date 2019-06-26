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

class Runtime_PropertyTests: XCTestCase {
    let rSon = Runtime(Son.self)
    
    
    func testGetProperty() {
//        let aaa = \Son2.age
        // Tq,N,Vage
        // Type q -> long long
        // N -> nonatomic
        // Value age
        XCTAssertTrue(rSon.getProperty(name: "age") != nil)
    }
    
    func testProperties() {
        //        let aaa = \Son2.age
        let aa = Runtime(NSString.self).properties
        let bb = rSon.properties
        XCTAssertTrue(Runtime(NSString.self).properties.count == 0)
        //        XCTAssertTrue(objcProtocol != nil)
    }
    
//    func testAddProtocol() {
//        XCTAssertEqual(rSon.classProtocols.count, 0)
//        XCTAssertFalse(rSon.isConformsTo(protocol: objcProtocol!))
//
//        XCTAssertTrue(rSon.add(protocol: objcProtocol!))
//
//        XCTAssertEqual(rSon.classProtocols.count, 1)
//        XCTAssertTrue(rSon.isConformsTo(protocol: objcProtocol!))
//    }
//
//    /// ??
//    func testAllProtocol() {
//        let ps = Runtime<Son2>.allRuntimeProtocols
//        XCTAssertEqual(ps.count, 905)
//    }
}

extension Runtime {
    /// Returns a property with a given name of a given class
    public func getProperty(name: String) -> RTProperty? {
        return RTProperty(raw: class_getProperty(self.class, name))
    }
    
    /// Describes the properties declared by a class.
    public var properties: [RTProperty] {
        return Misc
            .copyList { class_copyPropertyList(self.class, $0) }
            .map {RTProperty(raw: $0)}
    }
    
    /// Adds a property to a class.
    public func addProperty(name: String, attributes: inout [objc_property_attribute_t]) -> Bool {
        return class_addProperty(self.class, name, &attributes, UInt32(attributes.count))
    }
    
    /// Replace a property of a class.
    public func replaceProperty(name: String, attributes: inout [objc_property_attribute_t], count: UInt32) {
        class_replaceProperty(self.class, name, &attributes, UInt32(attributes.count))
    }
}
