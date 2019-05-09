//
//  Property.swift
//  YumeRuntime
//
//  Created by Yume on 2018/9/3.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Runtime {
    /// https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
    public struct _Property: RawInitable {
        let raw: objc_property_t
                
        /// Returns the name of a property.
        var name: String {
            return property_getName(self.raw).string
        }
        
        /// Returns the attribute string of a property.
        var attributes: String? {
            return property_getAttributes(self.raw)?.string
        }
        
        /// Returns the value of a property attribute given the attribute name.
        #warning("todo return type")
        func copyAttributeValue(name: String) -> String? { // UnsafeMutablePointer<Int8>?
            return property_copyAttributeValue(self.raw, name)?.string
        }
        
        //Returns an array of property attributes for a given property.
        var attributeList: [objc_property_attribute_t] {
            return Misc
                .copyList { property_copyAttributeList(self.raw, $0) }
        }
    }
}

extension Runtime._Property: CustomStringConvertible {
    public var description: String {
        return """
        \(raw) \(name): \(attributes ?? "nil")
        """
    }
}
