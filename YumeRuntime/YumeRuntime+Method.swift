//
//  YumeRuntime+Method.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Runtime {
    /// Returns the function pointer that would be called if a particular message were sent to an instance of a class.
    public func imp(selector: Selector) -> IMP? {
        return class_getMethodImplementation(self.class, selector)
    }
    
    /// Returns the function pointer that would be called if a particular message were sent to an instance of a class.
    public func impStret(selector: Selector) -> IMP? {
        return class_getMethodImplementation_stret(self.class, selector)
    }
    
    /// Returns a Boolean value that indicates whether instances of a class respond to a particular selector.
    public func isRespondsTo(selector: Selector) -> Bool {
        return class_respondsToSelector(self.class, selector)
    }
}

// MARK: Method
extension Runtime {
    public var methods: [Runtime._Method] {
        return Misc
            .copyList { class_copyMethodList(self.class, $0) }
            .map {Runtime._Method(raw: $0)}
    }
    
    public func addMethod(name: Selector, imp: IMP, types: String) -> Bool {
        return class_addMethod(self.class, name, imp, types)
    }
    
    public func replaceMethod(name: Selector, imp: IMP, types: String) -> IMP? {
        return class_replaceMethod(self.class, name, imp, types)
    }
}

extension Runtime {
    public func instanceMethod(name: Selector) -> Runtime._Method? {
        let method = class_getInstanceMethod(self.class, name)
        return _Method(raw: method)
    }
    
    public func classMethod(name: Selector) -> Runtime._Method? {
        let method = class_getClassMethod(self.class, name)
        return _Method(raw: method)
    }
}
