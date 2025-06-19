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
    
    // SUT = System Under Test
    var sut: SearchStoreViewModel!
    
    // MARK: - Setup
    
    @MainActor
    override func setUpWithError() throws {
        // Inicializa a variável antes de cada teste
        sut = SearchStoreViewModel(service: SearchService())
        
        sut.storeType = [StoreType(id: 1,
                                   name: "Monstro Burger",
                                   logoImage: nil,
                                   headerImage: nil,
                                   location: "Franfurter Allee 90",
                                   stars: 4, deliveryTime: "",
                                   rating: 3,
                                   reviewCount: nil,
                                   products: [],
                                   specialties: ["burger, hamburger"],
                                   deliveryPrice: 12),
        StoreType(id: 2,
                  name: "Food Court",
                  logoImage: nil,
                  headerImage: nil,
                  location: "AlexanderPlatz 123",
                  stars: 5,
                  deliveryTime: nil,
                  rating: 4,
                  reviewCount: 300,
                  products: [],
                  specialties: ["pizza,pasta"],
                  deliveryPrice: 8),
        StoreType(id: 3,
                  name: "Carbron",
                  logoImage: nil,
                  headerImage: nil,
                  location: "Weicheselstrasse 40",
                  stars: 3,
                  deliveryTime: "",
                  rating: 5,
                  reviewCount: nil,
                  products: [],
                  specialties: ["tacos, mexico"],
                  deliveryPrice: 13),
        StoreType(id: 4,
                  name: "Sushi",
                  logoImage: nil,
                  headerImage: nil,
                  location: "Samaritastrasse 49",
                  stars: 4,
                  deliveryTime: nil,
                  rating: 30,
                  reviewCount: 40,
                  products: [],
                  specialties: ["sushi,asian food"],
                  deliveryPrice: 14),
       ]
        
    }
    
    override func tearDownWithError() throws {
        // Cleanup se necessário
    }
    
    @MainActor
    func testFilteredStores() throws {
        sut.searchText = "Car"
        
        var filteredStores:[StoreType] = []
        
        do{
            filteredStores = try sut.filteredStores()
            XCTAssertEqual(1, filteredStores.count)
            XCTAssertEqual("Carbron", filteredStores[0].name)
        } catch{
            XCTFail("Failed to seach store")
        }
        
        /*
        let filteredStores = try sut.filteredStores()
        
        XCTAssertEqual(1, filteredStores.count)
        XCTAssertEqual("Carbron", filteredStores[0].name)
         
         */
    }
    
    @MainActor
    func testFilteredStoresWithSpecialCharactersInSearchText() throws {
        var filteredStores: [StoreType] = []
        
        sut.searchText = "!@#$%&"
        
        do {
            filteredStores = try sut.filteredStores()
            XCTFail("Failed to search")
            
        } catch {
            XCTAssertTrue(filteredStores.isEmpty)
        }
    }
    
    @MainActor
    func testFilteredStoresUsingTerm() {
        
        sut.searchText = "pizza"
        
        var filteredStores: [StoreType] = []
        
        do{
            filteredStores = try sut.filteredStores()
            XCTAssertEqual(1, filteredStores.count)
            XCTAssertEqual("Food Court", filteredStores[0].name)
        } catch{
            XCTFail("Faliled to search")
        }
        
    }
    
    @MainActor
    func testFilteredStoresException() {
        
        // Aqui vai testa a excessao
        
        sut.searchText = "xxZZz"
        XCTAssertThrowsError(try sut.filteredStores())
        
    }
    
}
