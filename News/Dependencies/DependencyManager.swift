//
//  DependencyManager.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

class DependencyManager: NSObject {
  fileprivate static let shared = DependencyManager()
  var webService : ServerManager!
    
    override init() {
        super.init()
        let client = Client(baseURL: "http://feeds.reuters.com")
        self.webService = ServerManager(client: client)
    }
}

extension NSObject {
    var rssService : ServerManager! {
        get {
            return DependencyManager.shared.webService
        }
        set(newValue){
            DependencyManager.shared.webService = newValue
        }
    }
}
