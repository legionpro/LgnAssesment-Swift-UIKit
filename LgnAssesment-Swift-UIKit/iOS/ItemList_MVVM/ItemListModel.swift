//
//  ItemDataModel.swift
//  iOS
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import Foundation

//MARK: - Data for main screen  -  Item List Controller
struct ItemListModel {
    private var items = [ItemDataModel]()
    
    mutating func addItem(_ item: ItemDataModel) {
        self.items.append(item)
    }
}


extension ItemListModel: ItemListModelProtocol {
    
    var itemsList: [ItemDataModel] {
        get { self.items }
        set { self.items = newValue}
    }
    
    //FIXME:  - Just for dummy data
    mutating func createData() {
        for i in 0..<10 {
            items.append(ItemDataModel(name:"Item name \(i)", image: ""))
        }
    }
}

