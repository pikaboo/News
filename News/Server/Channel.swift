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
}
