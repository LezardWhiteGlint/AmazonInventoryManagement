//
//  ContentView.swift
//  AmazonInventoryManagement
//
//  Created by Lezardvaleth on 2020/4/5.
//  Copyright © 2020 Lezardvaleth. All rights reserved.
//

import SwiftUI
import Cocoa

struct InventoryView: View {
    @State var inventoryDisplay = [Inventory]()
    
    var body: some View {
        
        VStack{
            List(inventoryDisplay){inventory in
                InventoryCellView(inventory: inventory)
                
            }
            Button(action: {self.inventoryDisplay = openTxt()})
            {Text("Import")}
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}

private func openTxt() -> [Inventory]{
    var inventory = [Inventory]()
    
    let dialog = NSOpenPanel()
//    set properties
    dialog.title = "选择库存TXT文档"
    dialog.showsHiddenFiles = false
    dialog.showsResizeIndicator = true
    dialog.canChooseDirectories = true
    dialog.canChooseFiles = true
    dialog.allowedFileTypes = ["txt"]
    dialog.allowsMultipleSelection = false
    let run = dialog.runModal()
//    if file is opened, get the url of the file
    if run.rawValue == 1{
        let result = dialog.url
//        read the txt file
        do {
            let text = try String(contentsOf: result!, encoding: .utf8)
            let lineByLine = text.split{$0.isNewline}
            var id = 0
            for line in lineByLine{
                let data = line.split(separator: "\t")
                if data.count == 4{
                    inventory.append(Inventory(id: id, sku: String(data[0]), amazonBefore: Int(String(data[3])), realBefore: Int(String(data[3])), amazonNow: Int(String(data[3])), realNow: Int(String(data[3]))))
                    id += 1
                }
            }
            return inventory
        }
        catch{
            print("file reading error")
        }
//        print(result)
    }
    return inventory
}
