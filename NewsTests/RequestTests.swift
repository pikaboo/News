//
//  RequestTests.swift
//  NewsTests
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import XCTest
@testable import News
import Hamcrest
import Alamofire
import AlamofireXmlToObjects
import FireMock
class RequestTests: XCTestCase {

    fileprivate var clientUnderTest: Client!
    override func setUp() {
        self.clientUnderTest = Client(baseURL: "http://feeds.reuters.com")
    }

    override func tearDown() {
        self.clientUnderTest = nil
        FireMock.unregisterAll()
    }

    func testCanSendRequest(){
        let expectation = self.expectation(description: "wait for server to load")
        let request = self.clientUnderTest.makeRequest(method: .get, path: "reuters/businessnews")
        request.responseString { (response) in
            assertThat(response.value, not(nilValue()))
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 30)
    }
    
    func testCanConvertResponseToPojo(){
        enqueueResponse(mock: Stubs.BusinessNews.success)
        let expectation = self.expectation(description: "wait for server to load")
        let request = self.clientUnderTest.makeRequest(method: .get, path: "reuters/businessnews")
        request.responseObject { (response: DataResponse<RSS>) in
            if let result = response.value {
                assertThat(result.channel, not(nilValue()))
                let count = result.channel!.item.count
                assertThat(count, not(equalTo(0)))
                let oneItem = result.channel.item[0]
                assertThat(oneItem, not(nilValue()))
                assertThat(oneItem.link, not(nilValue()))
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 1000)
    }

}
