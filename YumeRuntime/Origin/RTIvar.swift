//
//  Ivar.swift
//  YumeRuntime
//
//  Created by Yume on 2018/9/3.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation


public struct RTIvar: RawInitable {
    internal let raw: ObjectiveC.Ivar
    
    /// Returns the name of an instance variable.
    public var name: String? {
        return ivar_getName(raw)?.string
    }
    
    /// Returns the type string of an instance variable.
    public var typeEncoding: String? {
        return ivar_getTypeEncoding(raw)?.string
    }
    
    /// Returns the offset of an instance variable.
    public var offset: Int {
        return ivar_getOffset(raw)
    }
}


extension RTIvar: CustomStringConvertible {
    public var description: String {
        let _name = name ?? "nil"
        let _type = typeEncoding ?? "nil"
        return """
        \(raw) \(offset) \(_name): \(_type) 
        """
    }
}
