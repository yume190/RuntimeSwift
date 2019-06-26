//
//  YumeRuntime+Ivar.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Bridge where Bridge == RTIvar {
    /// Adds a new instance variable to a class.
    public func add(name: String, size: Int, alignmemt: UInt8, types: String) -> Bool {
        return class_addIvar(self.runtime.class, name, size, alignmemt, types)
    }
    
    /// Describes the instance variables declared by a class.
    public var list: [RTIvar] {
        return Misc
            .copyList { class_copyIvarList(self.runtime.class, $0) }
            .map {RTIvar(raw: $0)}
    }
    
    public var layout: String? {
        /// Returns a description of the Ivar layout for a given class.
        get {
            let layout = class_getIvarLayout(self.runtime.class)
            return layout?.string
        }
        ///Sets the Ivar layout for a given class.
        set {
            class_setIvarLayout(self.runtime.class, newValue)
        }
    }
    
    public var weakLayout: String? {
        /// Returns a description of the layout of weak Ivars for a given class.
        get {
            let weakIvarLayout = class_getWeakIvarLayout(self.runtime.class)
            return weakIvarLayout?.string
        }
        ///Sets the layout for weak Ivars for a given class.
        set {
            class_setIvarLayout(self.runtime.class, newValue)
        }
    }
}

///////////////////

extension Runtime {
    /// Adds a new instance variable to a class.
    public func addIvar(name: String, size: Int, alignmemt: UInt8, types: String) -> Bool {
        return class_addIvar(self.class, name, size, alignmemt, types)
    }
    
    /// Describes the instance variables declared by a class.
    public var ivars: [RTIvar] {
        return Misc
            .copyList { class_copyIvarList(self.class, $0) }
            .map {RTIvar(raw: $0)}
    }
    
    public var ivarLayout: String? {
        /// Returns a description of the Ivar layout for a given class.
        get {
            let layout = class_getIvarLayout(self.class)
            return layout?.string
        }
        ///Sets the Ivar layout for a given class.
        set {
            class_setIvarLayout(self.class, newValue)
        }
    }
    
    public var weakIvarLayout: String? {
      /// Returns a description of the layout of weak Ivars for a given class.
        get {
            let weakIvarLayout = class_getWeakIvarLayout(self.class)
            return weakIvarLayout?.string
        }
        ///Sets the layout for weak Ivars for a given class.
        set {
            class_setIvarLayout(self.class, newValue)
        }
    }
}
