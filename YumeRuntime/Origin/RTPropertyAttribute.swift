//
//  Attr.swift
//  YumeRuntime
//
//  Created by Yume on 2018/9/3.
//  Copyright © 2018年 Yume. All rights reserved.
//

import Foundation

struct RTPropertyAttribute: RawInitable {
    let raw: objc_property_attribute_t
    
    init(raw: objc_property_attribute_t) {
        self.raw = raw
    }
    
    init(name: String, value: String) {
        let raw = objc_property_attribute_t.init(name: name, value: value)
        self.init(raw: raw)
    }
    
    var name: String {
        return raw.name.string
    }
    
    var value: String? {
        return raw.value.string
    }
}
