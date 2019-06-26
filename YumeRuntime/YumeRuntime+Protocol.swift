//
//  YumeRuntime+Protocol.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Bridge where Bridge == RTProtocol {
    /// Adds a protocol to a class.
    public func add(`protocol`: Protocol) -> Bool {
        return class_addProtocol(self.runtime.class, `protocol`)
    }
    /// Adds a protocol to a class.
    public func add(`protocol`: RTProtocol) -> Bool {
        return self.add(protocol: `protocol`.raw)
    }
    
    /// Returns a Boolean value that indicates whether a class conforms to a given protocol.
    public func isConformsTo(`protocol`: Protocol) -> Bool {
        return class_conformsToProtocol(self.runtime.class, `protocol`)
    }
    
    /// Returns a Boolean value that indicates whether a class conforms to a given protocol.
    public func isConformsTo(`protocol`: RTProtocol) -> Bool {
        return self.isConformsTo(protocol: `protocol`.raw)
        //class_conformsToProtocol(self.class, `protocol`.raw)
    }
    
    /// Describes the protocols adopted by a class.
    public var list: [RTProtocol] {
        return Misc
            .copyList { class_copyProtocolList(self.runtime.class, $0) }
            .map { RTProtocol(raw: $0) }
    }
}

extension Bridge where Bridge == RTProtocol {
    /// Returns an array of all the protocols known to the runtime.
    public static var all: [RTProtocol] {
        return Misc
            .copyList(copyListFunction: objc_copyProtocolList)
            .map { RTProtocol(raw: $0) }
    }
}

//Working with Protocols
extension Bridge where Bridge == RTProtocol {
    ///Returns a specified protocol.
    /// only work on objc protocol
    public static func get(`protocol`: String) -> RTProtocol? {
        return RTProtocol(raw: objc_getProtocol(`protocol`))
    }
}

////////////

extension Runtime {
    /// Adds a protocol to a class.
    public func add(`protocol`: Protocol) -> Bool {
        return class_addProtocol(self.class, `protocol`)
    }
    /// Adds a protocol to a class.
    public func add(`protocol`: RTProtocol) -> Bool {
        return self.add(protocol: `protocol`.raw)
    }
    
    /// Returns a Boolean value that indicates whether a class conforms to a given protocol.
    public func isConformsTo(`protocol`: Protocol) -> Bool {
        return class_conformsToProtocol(self.class, `protocol`)
    }
    
    /// Returns a Boolean value that indicates whether a class conforms to a given protocol.
    public func isConformsTo(`protocol`: RTProtocol) -> Bool {
        return self.isConformsTo(protocol: `protocol`.raw)
            //class_conformsToProtocol(self.class, `protocol`.raw)
    }
    
    /// Describes the protocols adopted by a class.
    public var classProtocols: [RTProtocol] {
        return Misc
            .copyList { class_copyProtocolList(self.class, $0) }
            .map { RTProtocol(raw: $0) }
    }
}

extension Runtime {
    /// Returns an array of all the protocols known to the runtime.
    public static var allRuntimeProtocols: [RTProtocol] {
        return Misc
            .copyList(copyListFunction: objc_copyProtocolList)
            .map { RTProtocol(raw: $0) }
    }
}

//Working with Protocols
extension Runtime {
    ///Returns a specified protocol.
    /// only work on objc protocol
    public static func get(`protocol`: String) -> RTProtocol? {
        return RTProtocol(raw: objc_getProtocol(`protocol`))
    }
}
