//
//  YumeRuntime+ Instances.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation


extension Bridge where Bridge == RTIvar {
    /// Returns the Ivar for a specified instance variable of a given class.
    public func instance(name: String) -> RTIvar? {
        let ivar = class_getInstanceVariable(self.runtime.class, name)
        return RTIvar(raw: ivar)
    }
    
    /// Returns the Ivar for a specified class variable of a given class.
    public func `class`(name: String) -> RTIvar? {
        let ivar = class_getClassVariable(self.runtime.class, name)
        return RTIvar(raw: ivar)
    }
}

// MARK: Property
extension Runtime {
    /// Returns the Ivar for a specified instance variable of a given class.
    public func instanceVariable(name: String) -> RTIvar? {
        let ivar = class_getInstanceVariable(self.class, name)
        return RTIvar(raw: ivar)
    }
    
    /// Returns the Ivar for a specified class variable of a given class.
    public func classVariable(name: String) -> RTIvar? {
        let ivar = class_getClassVariable(self.class, name)
        return RTIvar(raw: ivar)
    }
}
