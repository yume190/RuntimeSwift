//
//  Init.swift
//  YumeRuntime
//
//  Created by Yume on 2018/11/29.
//  Copyright © 2018 Yume. All rights reserved.
//

import Foundation

protocol RawInitable {
    associatedtype Raw
    var raw: Raw { get }
    init(raw: Raw)
    init?(raw: Raw?)
}

extension RawInitable {
    init?(raw: Raw?) {
        guard let raw = raw else { return nil }
        self = Self(raw: raw)
    }
}
