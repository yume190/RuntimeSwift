//
//  Misc+Point.swift
//  YumeRuntime
//
//  Created by Yume on 2018/11/29.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

//protocol PointerArrayable {
//    associatedtype T
////    func buffer(count: Int) -> UnsafeBufferPointer<T>
//    func array(count: Int) -> [T]
//
//}
//
//// [Mutable|Raw|Buffer]
//extension UnsafePointer: PointerArrayable {
//    typealias T = Pointee
//    func array(count: Int) -> [T] {
//        let buffer = UnsafeBufferPointer(start: self, count: Int(count))
//        return Array(buffer)
//    }
//}
//extension UnsafeRawPointer {}
extension UnsafeBufferPointer {
    var array: [Element] {
        return Array(self)
    }
}
//extension UnsafeRawBufferPointer {}
//
//extension UnsafeMutablePointer: PointerArrayable {
//    typealias T = Pointee
//    func array(count: Int) -> [T] {
//        let buffer = UnsafeBufferPointer(start: self, count: Int(count))
//        return Array(buffer)
//    }
//}
//extension UnsafeMutableRawPointer {}
//extension UnsafeMutableBufferPointer {}
//extension UnsafeMutableRawBufferPointer {}
//
//extension AutoreleasingUnsafeMutablePointer: PointerArrayable {
//    typealias T = Pointee
//    func array(count: Int) -> [T] {
//        let buffer = UnsafeBufferPointer(start: self, count: Int(count))
//        return Array(buffer)
//    }
//}
