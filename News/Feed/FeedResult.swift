//
//  FeedRequest.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

class FeedResult: NSObject {
    var requestCompleted: Bool! = false
    var items: [Item]! = [Item]()
    
    func reset(){
        requestCompleted = false
    }
}
