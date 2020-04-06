//
//  InventoryCellView.swift
//  AmazonInventoryManagement
//
//  Created by Lezardvaleth on 2020/4/5.
//  Copyright © 2020 Lezardvaleth. All rights reserved.
//

import SwiftUI

struct InventoryCellView: View {
    var inventory:Inventory
    
    var body: some View {
        HStack{
            Text(inventory.sku)
            Text(String(inventory.amazonBefore ?? -1))
            Text(String(inventory.realBefore ?? -1))
        }
    }
}

struct InventoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryCellView(inventory: Inventory(id: 1, sku: "test", amazonBefore: 1, realBefore: 2, amazonNow: 3, realNow: 4))
    }
}
