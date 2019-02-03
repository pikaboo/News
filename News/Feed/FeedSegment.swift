//
//  FeedSegment.swift
//  News
//
//  Created by Lena Brusilovski on 03/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

class FeedSegment: NSObject {

    var segmentTitle: String!
    var segmentItems:[FeedResult]!
    
    var onUpdateItems:(()->Void)!
    
    convenience init(_ title:String, segmentItems:[FeedResult], onUpdateItems:@escaping (()->Void)) {
        self.init()
        self.segmentTitle = title
        self.segmentItems = segmentItems
        self.onUpdateItems = onUpdateItems
    }
}
