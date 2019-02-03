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
extension Stubs {
    static let baseURL = "http://\(host)"
    static let host = "feeds.reuters.com"
}
class Stubs: NSObject {
    
    //this needs to run before application did finish launching with options
    override init() {
        URLSessionConfiguration.classInit
        FireMock.onlyHosts = [Stubs.host]
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
    enum Entertainment: FireMockProtocolTest, FireMockInfo {
        case success
        
        var path: String {
            return ServerManager.Path_Entertainment
        }
        var statusCode: Int {
            return 200
        }
        
        func mockFile() -> String {
            switch self {
            case .success:
                return "entertainment.xml"
            }
        }
    }
    enum Environment: FireMockProtocolTest, FireMockInfo {
        case success
        
        var path: String {
            return ServerManager.Path_Environment
        }
        var statusCode: Int {
            return 200
        }
        
        func mockFile() -> String {
            switch self {
            case .success:
                return "environment.xml"
            }
        }
    }
}
