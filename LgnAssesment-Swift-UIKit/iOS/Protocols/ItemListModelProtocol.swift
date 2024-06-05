//
//  ItemListModelProtocol.swift
//  iOS
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import Foundation

//describes interface for ItemListModel
protocol ItemListModelProtocol {
    
    var itemsList: [ItemDataModel] {get}
    
    // FIXME: temporary solusion
    mutating func createData()
}
