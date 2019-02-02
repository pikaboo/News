//
//  TestsAppDelegate.swift
//  NewsTests
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

import UIKit
@testable import News
class TestsAppDelegate: AppDelegate {
    var stubs : Stubs!
    override init() {
        super.init()
        self.stubs = Stubs()
    }
    
}
