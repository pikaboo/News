//
//  Guid.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import EVReflection
class Guid: EVObject {
    var isPermaLink:String!
    
    var content:String!
    
   override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [("content","__text")]
    }
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        if key.contains("PermaLink") {
//            print("ignored key:\(key)")
        }else {
            super.setValue(value, forUndefinedKey: key)
        }
        
    }
}
