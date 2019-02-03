//
//  Item.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import EVReflection
extension Item : ItemModel {
    func reuseIdentifier() -> String {
       return FeedItemTableViewCell.FeedItemTableViewCellReuseIdentifier
    }
    func getTitle() -> String {
        return self.title
    }
    
    func getCategory() -> String {
        return self.category
    }
    
    func getDate() -> String {
        return self.pubDate
    }
    func getDescription() -> String {
        return self.desc
    }
}
class Item: EVObject {
    var link:String!
    
    var desc: String!
    
    var guid:Guid!
    
    var title:String!
    
    var category:String!
    
    var pubDate:String!
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [("desc","description")]
    }
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        if key.contains(":") {
//            print("ignored key:\(key)")
        }else {
            super.setValue(value, forUndefinedKey: key)
        }
    }
}
