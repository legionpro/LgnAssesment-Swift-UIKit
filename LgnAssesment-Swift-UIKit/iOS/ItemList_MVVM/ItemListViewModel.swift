//
//  ItemListViewModel.swift
//  iOS
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import Foundation
import Combine

class ItemListViewModel {
    private var currentPageNumber: Int = 1
    private var currentPageSize: Int = 10
    private var currentPageStep: Int = 10
    
    var bag = Set<AnyCancellable>()
    let networkService: NetworkServiceProtocol
    @Published var model: ItemListModelProtocol
    
    init(model: ItemListModelProtocol, networkService: NetworkServiceProtocol) {
        self.model = model
        self.networkService = networkService
    }
    
    
}

extension ItemListViewModel{
    var itemsList: [ItemDataModel] {
        get { self.model.itemsList }
    }
    
    // MARK: - load more data when user scroll to bottom
    // it provides pagination logic that implemented for now
    // it needs to be more smart
    // it causes the endpoint performace
    func loadMore() {
        guard currentPageNumber * currentPageSize < 10000 else { return }
        if currentPageNumber * currentPageSize <= (100 - currentPageStep) {
            currentPageSize += currentPageStep
        } else {
            currentPageNumber += 1
            currentPageSize = currentPageStep
        }
        self.resetItemsList()
    }
}

extension ItemListViewModel : ItemDataMapperProtocol {
    func resetItemsList() {
        let parametr = String("&p=\(currentPageNumber)&ps=\(currentPageSize)")
        let pub: AnyPublisher<ColectionObjects, APIError> = self.networkService.request(Endpoint.justGet, headers: nil, parameters: parametr )
        let subscription = pub
            .receive(on: DispatchQueue.main)
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
