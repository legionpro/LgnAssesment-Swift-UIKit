//
//  LgnAssesment_Swift_UIKitTests.swift
//  LgnAssesment-Swift-UIKitTests
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import XCTest
@testable import iOS
import Combine

final class LgnAssesment_Swift_UIKitTests: XCTestCase {
    
    var testService: NetworkServiceProtocol = NetworkServiceTest()
    var testModel: ItemListModelProtocol = ItemListModel()
    var itemListViewModel: ItemListViewModel? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        itemListViewModel = ItemListViewModel(model: testModel, networkService: testService)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        itemListViewModel!.resetItemsList()
        let expectation = XCTestExpectation(description: "Open a file asynchronously.")
        DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: {
            if self.itemListViewModel!.model.itemsList.count == 10 {
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


final class NetworkServiceTest: NetworkServiceProtocol {
    
    @Published var cpub: ColectionObjects?

    init() {
        cpub = createData()
    }
    func request<T>(_ endpoint: iOS.Endpoint, headers: [String : String]?, parameters: (any Encodable)?) -> AnyPublisher<T, iOS.APIError> where T : Decodable {
        let p = (cpub) as! T
        return Just(p).setFailureType(to: iOS.APIError.self).eraseToAnyPublisher()
    }
    
    func createData() -> ColectionObjects {
        var artObjectArry: [ArtObjects] = [ArtObjects]()
        for i in 0..<10 {
            var aObj = ArtObjects()
            aObj.title = "Tititle \(i)"
            aObj.longTitle = "Long Title  \(i)"
            aObj.webImage = WebImage()
            artObjectArry.append(aObj)
        }
        var cObj = ColectionObjects()
        cObj.artObjects = artObjectArry
        return  cObj
    }
}

