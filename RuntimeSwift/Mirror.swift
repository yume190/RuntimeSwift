//
//  Mirror.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/11/29.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

class AAA1 {
    var a1: Int = 1
}

class AAA2: AAA1 {
    var a2: Int = 2
}
class AAA3: AAA2 {
    var a3: Int = 3
    let style: Swift.Mirror.DisplayStyle = .class
}

extension Swift.Mirror.DisplayStyle {
    var kind: String {
        switch self {
        case .class: return "class"
        case .collection: return "collection"
        case .dictionary: return "dictionary"
        case .enum: return "enum"
        case .optional: return "optional"
        case .set: return "set"
        case .struct: return "struct"
        case .tuple: return "tuple"
        }
    }
}

extension Mirror {
    static func inspect<T>(_ obj: T) {
        Mirror(reflecting:obj).inspect()
    }
    func inspect() {
        print("Type of the object: \(subjectType)")
        print("Display style: \(displayStyle?.kind ?? "unknown")")
        print("Description: \(description)")
        //    print(mirror.descendant("a3"))
        print("properties:")
        let properties = children.map {
            """
            \($0.label ?? ""): \(type(of:$0.value)) = \($0.value)
            """
        }
        print(properties.joined(separator: "\n"))
        print("-----------------------------------")
        
        if let superMirror = superclassMirror {
            superMirror.inspect()
            
        }
    }
}
//Mirror.inspect(AAA3())

