//
//  FeedItemTableViewCell.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
extension FeedItemTableViewCell {
    static let FeedItemTableViewCellReuseIdentifier = "FeedItemTableViewCellReuseIdentifier"
}
class FeedItemTableViewCell: UITableViewCell, ItemTableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    func bind(item:ItemModel){
        self.title.text = item.getTitle()
        self.category.text = item.getCategory()
        self.date.text = item.getDate()
    }

    
}
