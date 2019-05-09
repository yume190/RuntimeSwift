//
//  Misc.swift
//  YumeRuntime
//
//  Created by Yume on 2018/9/3.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

struct Misc {
    internal static func copyList<T>(copyListFunction: (UnsafeMutablePointer<UInt32>?) -> UnsafeMutablePointer<T>?) -> [T] {
        var count: UInt32 = 0
        let list = copyListFunction(&count)
        let buffer = UnsafeBufferPointer(start: list, count: Int(count))
        return buffer.array
    }
    
    internal static func copyList<T>(copyListFunction: (UnsafeMutablePointer<UInt32>?) -> AutoreleasingUnsafeMutablePointer<T>?) -> [T] {
        var count: UInt32 = 0
        let list = copyListFunction(&count)
        let buffer = UnsafeBufferPointer(start: list, count: Int(count))
        return buffer.array
    }
}

extension String {
    var cPointer: UnsafePointer<CChar> {
        var cName = Array(self.utf8CString)
        let pointer: UnsafePointer<CChar> = self.to(pointer: &cName)
        return pointer
    }
    
    private func to(pointer: UnsafePointer<CChar>) -> UnsafePointer<CChar> {
        return pointer
    }
}

extension UnsafePointer where Pointee == Int8 {
    var string: String {
        return String(cString: self)
    }
}

extension UnsafePointer where Pointee == UInt8 {
    var string: String {
        return String(cString: self)
    }
}

extension UnsafeMutablePointer where Pointee == Int8 {
    var string: String {
        return String(cString: self)
    }
}

extension UnsafeMutablePointer where Pointee == UInt8 {
    var string: String {
        return String(cString: self)
    }
}

extension IMP {
    public func cast<T>() -> T {
        return unsafeBitCast(self, to: T.self)
    }
}
