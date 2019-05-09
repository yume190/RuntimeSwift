//
//  main.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/16.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation
import YumeRuntime

@objc protocol ABC: class {}


print(YumeRuntime.Runtime<AnyObject>.get(protocol: "NSObject")?.name)
print(YumeRuntime.Runtime<AnyObject>.get(protocol: "RuntimeSwift.ABC")?.name)



//let aaaa = Runtime.

////////////////////////////////////////////
let son = Son()
let rSon = Runtime(Son.self)
let rSon2 = Runtime(son)
let obj = Runtime(NSObject.self)

let sel = #selector(Son.call(count:))
let imp = rSon2.imp(selector: sel)


print(rSon.instanceMethod(name: sel)?.argumentsCount) // 3
print(rSon.instanceMethod(name: sel)?.getArgumentType(index: 0)) // @ id
print(rSon.instanceMethod(name: sel)?.getArgumentType(index: 1)) // : SEL
print(rSon.instanceMethod(name: sel)?.getArgumentType(index: 2)) // q long long
print(rSon.instanceMethod(name: sel)?.getDescription?.types) // q24@0:8q16
print(rSon.instanceMethod(name: sel)?.typeEncoding) // q24@0:8q16
print(rSon.instanceMethod(name: sel)?.copyReturnType)//q
print(rSon.instanceMethod(name: sel)?.getReturnType)//q
print(rSon.instanceMethod(name: sel)?.raw)// 0x0000000100009780
print(rSon.instanceMethod(name: sel)?.imp)// 0x0000000100002240



if let imp = imp {
    let _imp = cast(imp: imp)
    
    let _imp2: @convention(c) (AnyObject, Selector, Int) -> Int = imp.cast()
    
    let a = _imp(son, sel, 100)
    let b = _imp(son, sel, 100)
    print(a)
}
son.call(count: 10)

///////////////////////////////////////

//print(Runtime(Son.self).isMetaClass)

print(rSon.ivarLayout)
print(rSon.weakIvarLayout)

print(rSon.methods)
print(rSon.ivars)
print(rSon.version)

print(rSon.methods.first?.argumentsCount)
print(rSon.methods.first?.copyArgumentType(index: 0))
print(rSon.methods.first?.getArgumentType(index: 0))
