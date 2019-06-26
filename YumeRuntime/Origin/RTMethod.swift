//
//  Method.swift
//  YumeRuntime
//
//  Created by Yume on 2018/9/3.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation


public struct RTMethod: RawInitable {
    
    public let raw: ObjectiveC.Method
    
    /// Returns the name of a method.
    public let sel: ObjectiveC.Selector
    
    /// Returns the implementation of a method.
    public let imp: ObjectiveC.IMP
    
    public init(raw: ObjectiveC.Method) {
        self.raw = raw
        self.sel = method_getName(raw)
        self.imp = method_getImplementation(raw)
    }
    
    public var argumentsCount: UInt32 {
        return method_getNumberOfArguments(raw)
    }
    
    /// Returns a method description structure for a specified method.
    public var getDescription: RTMethodDescription? {
        return RTMethodDescription(raw: method_getDescription(self.raw).pointee)
    }
}


extension RTMethod: CustomStringConvertible {
    public var description: String {
        //            raw : \(raw)
        //            sel : \(sel)
        //            name : \(name)?
        var args: [String?] = []
        for index in 0..<argumentsCount {
            args.append(self.copyArgumentType(index: index))
        }
        
        return """
        
        \(self.sel.name) \(self.typeEncoding ?? "")
        """
//        method: \(raw),
//        imp: \(imp), \(sel)
    }
}

// MARK: Type encode
extension RTMethod {
    /// Returns a string describing a method's parameter and return types.
    public var typeEncoding: String? {
        return method_getTypeEncoding(raw)?.string
    }
    
    /// Returns a string describing a method's parameter and return types.
    public var copyReturnType: String {
        return method_copyReturnType(raw).string
    }
    
    /// Returns by reference a string describing a method's return type.
    public var getReturnType: String {
        var name = Array<Int8>(repeating: 0, count: 512)
        method_getReturnType(raw, &name, 512)
        return String(cString: &name)
    }
    
    /// Returns a string describing a single parameter type of a method.
    public func copyArgumentType(index: UInt32) -> String? {
        guard index < self.argumentsCount else { return nil }
        return method_copyArgumentType(raw, index)?.string
    }
    
    /// Returns by reference a string describing a single parameter type of a method.
    public func getArgumentType(index: UInt32) -> String? {
        guard index < self.argumentsCount else { return nil }
        var name = Array<Int8>(repeating: 0, count: 512)
        method_getArgumentType(raw, index, &name, 512)
        return String(cString: &name)
    }
}

// MARK: Change implementation
extension RTMethod {
    /// Sets the implementation of a method.
    public func setImplementation(imp: ObjectiveC.IMP) -> ObjectiveC.IMP {
        return method_setImplementation(self.raw, imp)
    }
    
    /// Exchanges the implementations of two methods.
    public func exchangeImplementations(method: ObjectiveC.Method) {
        method_exchangeImplementations(raw, method)
    }
    
    /// Exchanges the implementations of two methods.
    public func exchangeImplementations(method: RTMethod) {
        self.exchangeImplementations(method: method.raw)
    }
}

