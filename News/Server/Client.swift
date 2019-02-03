//
//  Client.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
public class Client: NSObject {
    public var baseURL : String! = ""
    fileprivate var manager: SessionManager!
    
    public required init(baseURL: String!){
        super.init()
        self.baseURL = baseURL
        let configuration = URLSessionConfiguration.default
        configuration.urlCredentialStorage = nil
        self.manager = Alamofire.SessionManager(configuration: configuration)
    }
    
    public func path(_ urlPath: String!)->String!{
        return "\(self.baseURL!)/\(urlPath!)"
    }
    
    public func makeRequest(method:HTTPMethod,path:String!) ->DataRequest{
        let url = self.path(path)!
        
        let dataRequest: DataRequest = self.manager.request(url,method:method)
        debugPrint(dataRequest)
        return dataRequest
    }
}
