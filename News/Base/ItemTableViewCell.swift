//
//  ItemTableViewCell.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

protocol ItemTableViewCell: class {

    func bind(item:ItemModel) -> Void

}
