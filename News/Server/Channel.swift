//
//  Channel.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import EVReflection
class Channel: EVObject {
    var image: Image!
    
    var copyright: String!
    
    var item:[Item] = [Item]()
    
    var lastBuildDate: String!
    
    var link: String!
    
    var desc: String!
    
    var language: String!
    
    var title:String!
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        if(key.contains(":")){
            //do nothing
//            print("ignored key:\(key)")
        }else {
            super.setValue(value, forUndefinedKey: key)
        }
    }
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [("desc","description")]
    }
}
