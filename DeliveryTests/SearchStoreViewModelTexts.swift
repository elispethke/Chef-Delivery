//
//  SearchStoreViewModelTexts.swift
//  DeliveryTests
//
//  Created by Elis Pethke on 21/05/25.
//

import XCTest
@testable import Delivery

final class SearchStoreViewModelTexts: XCTestCase {
  
    // MARK: - Attributes
    
    // Sut significa SytermUnderTest
    var sut: SearchStoreViewModel!
    
    // MARK: -  Setup
    @MainActor
    override func setUpWithError() throws {
      // aqui é para iniciar uma variavel antes de cada teste de Unidade
        
      sut = SearchStoreViewModel(service: SearchService())
    }

    override func tearDownWithError() throws {
        
    }

    @MainActor
    func testFilteredStores() throws {
        sut.storeType = [StoreType(id: 1,
                                   name: "Monstro Burger",
                                   logoImage: nil,
                                   headerImage: nil,
                                   location: "",
                                   stars: 4,
                                   deliveryTime: "",
                                   rating: 25,
                                   reviewCount: 3,
                                   products: [],
                                   specialties: [""],
                                   deliveryPrice: 25),
                         
                         StoreType(id: 2,
                                   name: "Food Court",
                                   logoImage: nil,
                                   headerImage: nil,
                                   location: "",
                                   stars: 6,
                                   deliveryTime: "",
                                   rating: 20,
                                   reviewCount: 5,
                                   products: [],
                                   specialties: [""],
                                   deliveryPrice: 23),
                         
                         StoreType(id: 3,
                                   name: "Carbron",
                                   logoImage: nil,
                                   headerImage: nil,
                                   location: "",
                                   stars: 7,
                                   deliveryTime: nil,
                                   rating: 23,
                                   reviewCount: 4,
                                   products: [],
                                   specialties: [""],
                                   deliveryPrice: 12)
        ]
        
        sut.searchText = "Car"
        
        let filteredStores =  try sut.filteredStores()
        
        XCTAssertEqual(1, filteredStores.count)
        XCTAssertEqual("Carbron", filteredStores[0].name)
        
    }

}
