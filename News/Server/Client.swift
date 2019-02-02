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
    
    
    public required init(baseURL: String!){
        super.init()
        self.baseURL = baseURL
    }
    
    public func path(_ urlPath: String!)->String!{
        return "\(self.baseURL!)/\(urlPath!)"
    }
    
    public func makeRequest(method:HTTPMethod,path:String!) ->DataRequest{
        let url = self.path(path)!
        
        let dataRequest: DataRequest = Alamofire.request(url,method:method)
        debugPrint(dataRequest)
        return dataRequest
    }
}
