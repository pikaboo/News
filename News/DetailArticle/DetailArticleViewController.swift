//
//  DetailArticleViewController.swift
//  News
//
//  Created by Lena Brusilovski on 03/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

class DetailArticleViewController: UIViewController,FeedItemViewModel {
    fileprivate var feedItem : ItemModel!{
        didSet{
            if self.isViewLoaded {
                self.applyItemProperties()
            }
        }
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyItemProperties()
    }
    
    func applyItemProperties(){
        self.titleLabel.text = self.feedItem.getTitle()
        self.dateLabel.text = self.feedItem.getDate()
        let htmlText = self.feedItem.getDescription()
        if let htmlData = htmlText.data(using: .utf8) {
            do {
                let attributedText = try NSAttributedString(data: htmlData,
                                                            options: [.documentType:NSAttributedString.DocumentType.html],
                                                            documentAttributes: nil)
                self.descriptionLabel.attributedText = attributedText
            } catch let e {
                print("Couldn't translate \(htmlText): \(e.localizedDescription) ")
                self.descriptionLabel.text = self.feedItem.getDescription()
            }
        }else {
            self.descriptionLabel.text = self.feedItem.getDescription()
        }
    }
    func setItem(item: ItemModel) {
        self.feedItem = item
    }
    

}
