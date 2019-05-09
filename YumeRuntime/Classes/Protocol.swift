//
//  Protocol.swift
//  YumeRuntime
//
//  Created by Yume on 2018/9/3.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Runtime {
    public struct _Protocol: RawInitable {
        let raw: Protocol
                
        /// Returns a the name of a protocol.
        public var name: String {
            return protocol_getName(self.raw).string
        }
        
        /// Creates a new protocol instance.
        public static func allocate(name: String) -> _Protocol? {
            return _Protocol(raw: objc_allocateProtocol(name))
        }
        
        /// Registers a newly created protocol with the Objective-C runtime.
        public func register() {
            objc_registerProtocol(self.raw)
        }
        
        /// Adds a registered protocol to another protocol that is under construction.
        func add(`protocol`: _Protocol) {
            return protocol_addProtocol(self.raw, `protocol`.raw)
        }
        
        /// Returns an array of the protocols adopted by a protocol.
        var copyProtocols: [Runtime._Protocol] {
            return Misc
                .copyList { protocol_copyProtocolList(self.raw, $0) }
                .map { Runtime._Protocol(raw: $0) }
        }
        
        /// Returns a Boolean value that indicates whether one protocol conforms to another protocol.
        func conformsTo(`protocol`: Protocol?) -> Bool {
            return protocol_conformsToProtocol(self.raw, `protocol`)
        }
    }
}

extension Runtime._Protocol: Equatable {
    //Returns a Boolean value that indicates whether two protocols are equal.
    public static func == (lhs: Runtime._Protocol, rhs: Runtime._Protocol) -> Bool {
        return protocol_isEqual(lhs.raw,rhs.raw)
    }
}

// MARK: Description
extension Runtime._Protocol {
    /// Returns a method description structure for a specified method of a given protocol.
    func methodDescription(sel: Selector, isRequiredMethod: Bool = true, isInstanceMethod: Bool = true) -> objc_method_description {
        return protocol_getMethodDescription(self.raw, sel, isRequiredMethod, isInstanceMethod)
    }
    
    /// Adds a method to a protocol.
    func addMethodDescription(sel: Selector, type: String, isRequiredMethod: Bool = true, isInstanceMethod: Bool = true) {
        protocol_addMethodDescription(self.raw, sel, type, isRequiredMethod, isInstanceMethod)
    }
    
    /// Returns an array of method descriptions of methods meeting a given specification for a given protocol.
    func copyMethodDescriptionList(isRequiredMethod: Bool = true, isInstanceMethod: Bool = true, outCount: inout UInt32) -> [Runtime.MethodDescription] {
        let pointer = protocol_copyMethodDescriptionList(self.raw, isRequiredMethod, isInstanceMethod, &outCount)

        let buffer = UnsafeBufferPointer(start: pointer, count: Int(outCount))
        return buffer
            .array
            .map { Runtime.MethodDescription(raw: $0) }
    }
}

// MARK: Propery
extension Runtime._Protocol {
    /// Returns the specified property of a given protocol.
    func getProperty(name: String, isRequiredProperty: Bool = true, isInstanceProperty: Bool = true) -> objc_property_t? {
        return protocol_getProperty(self.raw, name, isRequiredProperty, isInstanceProperty)
    }
    
    /// Adds a property to a protocol that is under construction.
    func addProperty(name: String, attributes: inout [objc_property_attribute_t], isRequiredProperty: Bool = true, isInstanceProperty: Bool = true) {
        protocol_addProperty(self.raw, name, &attributes, UInt32(attributes.count), isRequiredProperty, isInstanceProperty)
    }

    /// Returns an array of the properties declared by a protocol.
    var properties: [Runtime._Property] {
        return Misc
            .copyList{ protocol_copyPropertyList(self.raw, $0) }
            .map { Runtime._Property(raw: $0) }
    }
}
