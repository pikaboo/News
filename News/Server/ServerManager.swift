//
//  ServerManager.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
import AlamofireXmlToObjects
import Alamofire
extension ServerManager {
    static let Path_BusinessNews = "reuters/businessnews"
    static let Path_Entertainment = "reuters/entertainment"
    static let Path_Environment = "reuters/environment"
}
typealias ItemsReceived = (String,Error?,[Item]) -> Void
class ServerManager: NSObject {

    fileprivate var client: Client!
    
    convenience init(client:Client) {
        self.init()
        self.client = client
    }
    
    fileprivate func getItems(path:String, completion:ItemsReceived? = nil){
        self.client.makeRequest(method: .get, path:path).responseObject  { (response: DataResponse<RSS>) in
            guard response.error == nil else {
                completion?(path, response.error,[])
                return
            }
            completion?(path, nil, response.value?.channel.item ?? [])
        }
    }
    func getBusinessNews(completion:@escaping ItemsReceived){
       getItems(path: ServerManager.Path_BusinessNews, completion: completion)
    }
    func getEntertainment(completion:@escaping ItemsReceived){
        getItems(path: ServerManager.Path_Entertainment, completion: completion)
    }
    func getEnvironment(completion:@escaping ItemsReceived){
        getItems(path: ServerManager.Path_Environment, completion: completion)
    }
}
