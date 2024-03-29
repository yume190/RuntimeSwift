//
//  YumeRuntime+Property.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Bridge where Bridge == RTProperty {
    /// Returns a property with a given name of a given class
    public func get(name: String) -> RTProperty? {
        return RTProperty(raw: class_getProperty(self.runtime.class, name))
    }
    
    /// Describes the properties declared by a class.
    public var list: [RTProperty] {
        return Misc
            .copyList { class_copyPropertyList(self.runtime.class, $0) }
            .map {RTProperty(raw: $0)}
    }
    
    /// Adds a property to a class.
    public func add(name: String, attributes: inout [objc_property_attribute_t]) -> Bool {
        return class_addProperty(self.runtime.class, name, &attributes, UInt32(attributes.count))
    }
    
    /// Replace a property of a class.
    public func replace(name: String, attributes: inout [objc_property_attribute_t], count: UInt32) {
        class_replaceProperty(self.runtime.class, name, &attributes, UInt32(attributes.count))
    }
}

//////////////////////////////

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
