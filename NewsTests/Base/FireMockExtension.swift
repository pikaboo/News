//
//  FireMockExtension.swift
//  NewsTests
//
//  Created by Lena Brusilovski on 01/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import FireMock
import Hamcrest
protocol FireMockProtocolTest : FireMockProtocol {
    
}
extension FireMockProtocolTest {
    var bundle: Bundle { return Bundle(for: Stubs.self) }
}

protocol FireMockInfo {
    var method : MockHTTPMethod { get }
    var path: String { get }
}

extension FireMockInfo {
    var method : MockHTTPMethod { return .get }
    var path: String { return "" }
}

extension NSObject {
    func enqueueResponse<T: FireMockProtocol & FireMockInfo>(mock: T) {
        let path : String = mock.path
        assertThat(path.count, not(equalTo(0)))
        let url = URL(string:"http://feeds.reuters.com/\(path)")
        print("registering mock for \(String(describing: url?.absoluteString))")
        FireMock.register(mock: mock, forURL: url!, httpMethod: mock.method, enabled: true)
    }
}
