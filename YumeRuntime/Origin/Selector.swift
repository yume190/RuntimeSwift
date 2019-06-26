//
//  YumeRuntime+Selector.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

extension Selector {
    //Returns the name of the method specified by a given selector.
    var name: String {
        return sel_getName(self).string
    }
    
    /// Registers a method with the Objective-C runtime system, maps the method name to a selector, and returns the selector value.
    public static func register(name: String) -> Selector {
        return sel_registerName(name)
    }
    
    /// Registers a method name with the Objective-C runtime system.
    public static func getUid(name: String) -> Selector {
        return sel_getUid(name)
    }
    
    // Don't need to imp
    //func sel_isEqual(Selector, Selector) -> Bool
    //Returns a Boolean value that indicates whether two selectors are equal.
}
