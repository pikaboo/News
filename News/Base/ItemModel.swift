//
//  ItemModel.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit

protocol ItemModel:class {
    func reuseIdentifier() -> String
    
    func getTitle() -> String
    func getCategory() -> String
    func getDate() -> String
    func getDescription() -> String
}
