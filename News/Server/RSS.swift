//
//  RSS.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import EVReflection
class RSS: EVObject {

    var channel: Channel!
    var version: String!
    var feedburner:String!
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [("_xmlns:feedburner","feedburner")]
    }
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        if key.contains(":") || key.contains("_") {
//            print("ignored key:\(key)")
        }else {
            super.setValue(value, forUndefinedKey: key)
        }
        
    }
}
