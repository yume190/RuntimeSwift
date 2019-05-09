//
//  Bind.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/7/17.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

infix operator >>- :BindPrecedence
precedencegroup BindPrecedence {
    // 132
    associativity: left
    lowerThan: RangeFormationPrecedence //135
    higherThan: ComparisonPrecedence //130
}

public func >>- <T,U>(box : Optional<T>, f : (T) -> Optional<U>) -> Optional<U> {
    return box.flatMap {f($0)}
}
