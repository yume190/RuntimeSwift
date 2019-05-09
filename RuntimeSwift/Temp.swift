//
//  Temp.swift
//  RuntimeSwift
//
//  Created by Yume on 2018/10/19.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

enum Either<Left, Right> {
    case left(Left)
    case right(Right)
}

typealias Expandable<Object>
    = Either<String, Object> where Object: Decodable

protocol Yume {
    func a()
}
//extension Yume {
//    func a() {}
//}
extension Either: Yume where Left: Decodable & Yume, Right: Yume {
    func a() {
        switch self {
        case .left(let l):
            
            l.a()
        case .right(let r):
            r.a()
        }
    }
}

//extension Either: Decodable where Left: Decodable, Right: Decodable {
//    init(from decoder: Decoder) throws {
//
//        do {
//            try Left(decoder: decoder)
//            self = Either.left(try Left(decoder: decoder))
//        } catch {
//            self = Either.right(try Right(decoder: decoder))
//        }
//        throw NSError(domain: "", code: 0, userInfo: nil)
//    }
//}

typealias Result<T> = Either<T,Error>
//enum Result<Value> {
//case value(Value)
//case error(Error)
//}
