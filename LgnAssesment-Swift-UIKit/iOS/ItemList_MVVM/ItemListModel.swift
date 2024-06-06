//
//  ItemDataModel.swift
//  iOS
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import Foundation
import Observation


//MARK: - Data for main screen  -  Item List Controller
@Observable
class ItemListModel {
    private var items = [ItemDataModel]()
    
    func addItem(_ item: ItemDataModel) {
        self.items.append(item)
    }
}

extension ItemListModel: ItemListModelProtocol {
    
    var itemsList: [ItemDataModel] {
        get { self.items }
        set { self.items = newValue}
    }
    
    //FIXME:  - Just for dummy data
    func createData() {
        for i in 0..<10 {
            items.append(ItemDataModel(name:"Item name \(i)", description: "Item name \(i)", webImageUrl: ""))
        }
    }
}

