//
//  ItemDataMapperProtocol.swift
//  iOS
//
//  Created by Oleh Poremskyy on 05.06.2024.
//

import Foundation

// MARK: - jsut protocol for mapping  response data to items
@MainActor
protocol ItemDataMapperProtocol {

    func itemResponseToItem(_ response: ColectionObjects ) -> [ItemDataModel]
}


// FIXME: - needs real implematation
extension ItemDataMapperProtocol {

    func itemResponseToItem(_ response: ColectionObjects ) -> [ItemDataModel] {
        var result = [ItemDataModel]()
        if let resp = response.artObjects {
            let _ = resp.map{ result.append(ItemDataModel(name: $0.title ?? "", description: $0.longTitle ?? $0.title ?? "" , webImageUrl: $0.webImage?.url ?? "")) }
        }
        return result
    }
}
