//
//  Stubs.swift
//  NewsTests
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

import FireMock
@testable import News
class Stubs: NSObject {
    
    override init() {
        URLSessionConfiguration.classInit
        FireMock.onlyHosts = ["feeds.reuters.com"]
        FireMock.enabled(true)
        FireMock.debug(enabled: true)
        super.init()
    }
    
}

extension Stubs {
    enum BusinessNews: FireMockProtocolTest, FireMockInfo {
        case success
        
        var path: String {
            return ServerManager.Path_BusinessNews
        }
        var statusCode: Int {
            return 200
        }
        
        func mockFile() -> String {
            switch self {
            case .success:
                return "businessNews.xml"
            }
        }
    }
}
