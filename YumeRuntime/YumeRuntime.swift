//
//  YumeRuntime.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/17.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

public struct Runtime<T: AnyObject> {
    public init(_ object: T) {
        self.obj = Inner.object(object)
    }
    public init(_ type: T.Type) {
        self.obj = Inner.classType(type)
    }
    
    public init(any: AnyClass) {
        self.obj = Inner.any(any)
    }
    
    private let obj: Inner<T>
}

// MARK: Misc
extension Runtime {
    public var `class`: AnyClass? {
        return obj.class
    }
    
    /// Returns the name of a class.
    public var className: String {
        return class_getName(self.class).string
    }
    
    /// Returns the superclass of a class.
    public var `super`: Runtime<AnyObject>? {
        guard let _super = class_getSuperclass(self.class) else {
            return nil
        }
        return Runtime<AnyObject>(_super)
    }
    
    public var meta: Runtime<AnyObject>? {
        switch self.obj {
        case .object(let obj):
            guard let _type: AnyClass = object_getClass(obj) else { return nil }
            return Runtime<AnyObject>(any: _type)
        case .classType(let `type`):
            guard let _type: AnyClass = object_getClass(type) else { return nil }
            return Runtime<AnyObject>(any: _type)
        case .any(let _class):
            guard let _type: AnyClass = object_getClass(_class) else { return nil }
            return Runtime<AnyObject>(any: _type)
        }
    }
    
    /// Returns a Boolean value that indicates whether a class object is a metaclass.
    public var isMetaClass: Bool {
        return class_isMetaClass(self.class)
    }
    
    /// Returns the size of instances of a class.
    public var size: Int {
        return class_getInstanceSize(self.class)
    }
    
    public var version: Int32 {
        /// Sets the version number of a class definition.
        set {
            class_setVersion(self.class, newValue)
        }
        
        /// Returns the version number of a class definition.
        get {
            return class_getVersion(self.class)
        }
    }
}

extension Runtime {
    private enum Inner<T: AnyObject> {
        case object(T)
        case classType(T.Type)
        case any(AnyClass)
        
//        var `class`: T.Type? {
//            switch self {
//            case .object(let obj):
//                return type(of: obj).self
//            case .classType(let `type`):
//                return type
//            }
//        }
        
        var `class`: AnyClass? {
            switch self {
            case .object(let obj):
                return type(of: obj).self
            case .classType(let `type`):
                return type
            case .any(let _class):
                return _class
            }
        }

    }
}
