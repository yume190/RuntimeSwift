//
//  YumeRuntime+Bridge.swift
//  YumeRuntime
//
//  Created by Yume on 2019/5/9.
//  Copyright © 2019 Yume. All rights reserved.
//

import Foundation

//extension Runtime {
public struct Bridge<T: AnyObject, Bridge> {
    internal let runtime: Runtime<T>
    internal init(runtime: Runtime<T>) {
        self.runtime = runtime
    }
}
//}

extension Runtime {
    public var method: Bridge<T, RTMethod> {
        return Bridge<T, RTMethod>(runtime: self)
    }
    
    public var ivar: Bridge<T, RTIvar> {
        return Bridge<T, RTIvar>(runtime: self)
    }
    
    public var `protocol`: Bridge<T, RTProtocol> {
        return Bridge<T, RTProtocol>(runtime: self)
    }
    
    public var property: Bridge<T, RTProperty> {
        return Bridge<T, RTProperty>(runtime: self)
    }
    
//    public var ivar: Bridge<T, RTIvar> {
//        return Bridge<T, RTMethod>(runtime: self)
//    }
}
