//
//  MethodDescription.swift
//  YumeRuntime
//
//  Created by Yume on 2018/11/29.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

extension Runtime {
    
    public struct MethodDescription {//}: CustomStringConvertible {
        
        let raw: ObjectiveC.objc_method_description
        
        public var name: Selector? {
            return self.raw.name
        }
        
        public var types: String? {
            return self.raw.types?.string
        }
        
//        #warning("todo")
//        public var description: String = ""
    }
}
