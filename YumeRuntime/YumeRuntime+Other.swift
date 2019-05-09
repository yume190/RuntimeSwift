//
//  YumeRuntime+Other.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/18.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

//Working with Classes
//Adding Classes
//Working with Instances
//Obtaining Class Definitions
//Working with Instance Variables
//Associative References

// https://developer.apple.com/documentation/objectivec/objective_c_runtime/imp
// id (*IMP)(id, SEL, ...)

public typealias _IMP = @convention(c) (AnyObject, Selector, Int) -> Int
public typealias _IMP2 = (AnyObject, Selector, AnyObject ...) -> Void
public func cast(imp: IMP) -> _IMP {
//    Stream
    return unsafeBitCast(imp, to: _IMP.self)
}


// api
//https://developer.apple.com/documentation/objectivec/objective_c_runtime?changes=_3

// apple runtime guide
//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html
// other
//https://swiftcafe.io/2016/01/16/objc-runtime/
//https://www.jianshu.com/p/f73ea068efd2
//https://halfrost.com/objc_runtime_isa_class/
//http://www.cocoachina.com/ios/20141224/10740.html
//https://www.jianshu.com/p/6ae8c83a2130
//http://www.imlifengfeng.com/blog/?p=392
//http://yulingtianxia.com/blog/2014/11/05/objective-c-runtime/
//https://www.jianshu.com/p/9c36a5b7820a
//https://www.jianshu.com/p/e5aef096f967

//https://www.jianshu.com/p/e0079206e786
//https://blog.csdn.net/iosswift/article/details/42361183


//Using Objective-C Language Features
//func objc_enumerationMutation(Any)
//Inserted by the compiler when a mutation is detected during a foreach iteration.
//
//func objc_setEnumerationMutationHandler(((Any) -> Void)?)
//Sets the current mutation handler.
//
//func imp_implementationWithBlock(Any) -> IMP
//Creates a pointer to a function that calls the specified block when the method is called.
//
//func imp_getBlock(IMP) -> Any?
//Returns the block associated with an IMP that was created using
//imp_implementationWithBlock(_:)
//    .
//    
//func imp_removeBlock(IMP) -> Bool
//Disassociates a block from an IMP that was created using
//imp_implementationWithBlock(_:)
//, and releases the copy of the block that was created.
//
//func objc_loadWeak(AutoreleasingUnsafeMutablePointer<AnyObject?>) -> Any?
//Loads the object referenced by a weak pointer and returns it.
//
//func objc_storeWeak(AutoreleasingUnsafeMutablePointer<AnyObject?>, Any?) -> Any?
//Stores a new value in a __weak variable.
