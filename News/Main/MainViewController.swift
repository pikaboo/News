//
//  MainViewController.swift
//  News
//
//  Created by Lena Brusilovski on 01/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var selectedPostLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedPostLabel.text = ""
        onMainThread(self, name: FeedEvents.FeedItemSelected) {[weak self] (note) in
            if let item = note?.userInfo?[FeedEvents.FeedItemKey] as? ItemModel {
                self?.selectedPostLabel.text = item.getTitle()
            }
        }
    }
    deinit {
        unregisterFromEvents(self)
    }


}

