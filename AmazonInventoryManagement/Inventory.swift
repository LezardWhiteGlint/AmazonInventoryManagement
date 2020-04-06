//
//  Inventory.swift
//  AmazonInventoryManagement
//
//  Created by Lezardvaleth on 2020/4/5.
//  Copyright © 2020 Lezardvaleth. All rights reserved.
//

import Foundation

struct Inventory:Identifiable {
    var id:Int
    var sku:String
    var amazonBefore:Int?
    var realBefore:Int?
    var amazonNow:Int?
    var realNow:Int?
}
