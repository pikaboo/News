//
//  ServerManagerTests.swift
//  NewsTests
//
//  Created by Lena Brusilovski on 03/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import XCTest
@testable import News
import FireMock
import Hamcrest
class ServerManagerTests: XCTestCase {

    var serverManagerUnderTest:ServerManager!
    
    override func setUp() {
        let client = Client(baseURL: Stubs.baseURL)
        self.serverManagerUnderTest = ServerManager(client: client)
    }

    override func tearDown() {
        FireMock.unregisterAll()
    }

    func testBusinessNewsInvokesCallback(){
        enqueueResponse(mock: Stubs.BusinessNews.success)
        let expectation = self.expectation(description: "wait for server to load")
        self.serverManagerUnderTest.getBusinessNews { (path, error, items) in
            assertThat(path,equalTo(ServerManager.Path_BusinessNews))
            assertThat(items,not(nilValue()))
            assertThat(items.count,greaterThan(0))
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 30)
    }
    func testEnvironmentInvokesCallback(){
        enqueueResponse(mock: Stubs.Environment.success)
        let expectation = self.expectation(description: "wait for server to load")
        self.serverManagerUnderTest.getEnvironment { (path, error, items) in
            assertThat(path,equalTo(ServerManager.Path_Environment))
            assertThat(items,not(nilValue()))
            assertThat(items.count,greaterThan(0))
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 30)
    }
    func testEntertainmeentInvokesCallback(){
        enqueueResponse(mock: Stubs.Entertainment.success)
        let expectation = self.expectation(description: "wait for server to load")
        self.serverManagerUnderTest.getEntertainment { (path, error, items) in
            assertThat(path,equalTo(ServerManager.Path_Entertainment))
            assertThat(items,not(nilValue()))
            assertThat(items.count,greaterThan(0))
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 30)
    }

}
