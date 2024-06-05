//
//  ItemListViewModel.swift
//  iOS
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import Foundation
import Combine

class ItemListViewModel {
    
    var bag = Set<AnyCancellable>()
    private var model: ItemListModelProtocol
    
    init(model: ItemListModelProtocol) {
        self.model = model
    }
    
}

extension ItemListViewModel{
    
    var itemsList: [ItemDataModel] {
        get { self.model.itemsList }
    }
}

extension ItemListViewModel : ItemDataMapperProtocol {

    func resetItemsList() {
        let pub: AnyPublisher<ColectionObjects, APIError> = NetworkService().request(Endpoint.justGet)
        let subscription = pub
            .sink { completion in
                switch completion {
                case .finished:
                  print("All the requests are done")
                case .failure(let apiError):
                  print("An API error caused a problem \(apiError)")
                }
            } receiveValue: { [self] results in
                Task {
                  if var res: ColectionObjects = results as? ColectionObjects {
                          self.model.itemsList = await self.itemResponseToItem(res)
                      }
                  }
              }
              .store(in: &bag)
    }
}

//FIXME: -  To provide dummy data fot viewcontroller
extension ItemListViewModel {
    var dummyItemsList: [ItemDataModel] {
        get {
            self.model.createData()
            return self.model.itemsList
        }
    }
}
