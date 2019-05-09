//
//  YumeRuntime+ Instances.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

// MARK: Property
extension Runtime {
    /// Returns the Ivar for a specified instance variable of a given class.
    public func instanceVariable(name: String) -> Runtime._Ivar? {
        let ivar = class_getInstanceVariable(self.class, name)
        return Runtime._Ivar(raw: ivar)
    }
    
    /// Returns the Ivar for a specified class variable of a given class.
    public func classVariable(name: String) -> Runtime._Ivar? {
        let ivar = class_getClassVariable(self.class, name)
        return Runtime._Ivar(raw: ivar)
    }
}
