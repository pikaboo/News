//
//  ServerManager.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
extension ServerManager {
    static let Path_BusinessNews = "reuters/businessnews"
    static let Path_Entertainment = "reuters/entertainment"
    static let Path_Environment = "reuters/environment"
}
class ServerManager: NSObject {

    fileprivate var client: Client!
    
    convenience init(client:Client) {
        self.init()
        self.client = client
    }
    
    func getBusinessNews(){
//        self.client.makeRequest(method: .get, path: ServerManager.Path_BusinessNews).responseObject
    }

}
