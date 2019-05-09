//
//  YumeRuntime+Protocol.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Runtime {
    /// Adds a protocol to a class.
    public func add(`protocol`: _Protocol) -> Bool {
        return class_addProtocol(self.class, `protocol`.raw)
    }
    
    /// Returns a Boolean value that indicates whether a class conforms to a given protocol.
    public func isConformsTo(`protocol`: _Protocol) -> Bool {
        return class_conformsToProtocol(self.class, `protocol`.raw)
    }
    
    /// Describes the protocols adopted by a class.
    public var classProtocols: [_Protocol] {
        return Misc
            .copyList { class_copyProtocolList(self.class, $0) }
            .map { _Protocol(raw: $0) }
    }
}

extension Runtime {
    /// Returns an array of all the protocols known to the runtime.
    public static var allRuntimeProtocols: [_Protocol] {
        return Misc
            .copyList(copyListFunction: objc_copyProtocolList)
            .map { _Protocol(raw: $0) }
    }
}

//Working with Protocols
extension Runtime {
    ///Returns a specified protocol.
    /// only work on objc protocol
    public static func get(`protocol`: String) -> _Protocol? {
        return _Protocol(raw: objc_getProtocol(`protocol`))
    }
}
