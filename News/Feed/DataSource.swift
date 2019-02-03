//
//  DataSource.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

class DataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    fileprivate var items:[ItemModel] = [ItemModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseIdentifier())
        if let c = cell as? ItemTableViewCell {
            c.bind(item: item)
        }
        
        return cell ?? UITableViewCell()
    }
    
    func clear(){
        self.items.removeAll()
    }
    func addItems(items:[ItemModel]){
        self.items.append(contentsOf: items)
    }
    
    func item(at indexPath:IndexPath) -> ItemModel {
        return self.items[indexPath.row]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.item(at: indexPath)
        //notify anyone who wants to know the item was selected
        post(FeedEvents.FeedItemSelected, userInfo: [FeedEvents.FeedItemKey:item])
    }
}
