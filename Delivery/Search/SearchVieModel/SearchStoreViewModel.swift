//
//  SearchStoreViewModel.swift
//  Delivery
//
//  Created by Elis Pethke on 21/05/25.
//

import Foundation

enum SearchError: Error, Equatable {
    case noResultsFound
    case networkFailure
}

@MainActor
class SearchStoreViewModel: ObservableObject {
    
    // MARK: - Attributes
    
    let service: SearchService
    @Published var storeType: [StoreType] = []
    @Published var searchText: String = ""
    
    // MARK: - Init
    
    init(service: SearchService) {
        self.service = service
        fetchData()
    }
    
    // MARK: - Methods
    
    func fetchData() {
        Task { @MainActor in
            do {
                let result = try await service.fetData()
                switch result {
                case .success(let stores):
                    self.storeType = stores
                case .failure(let error):
                    print("Service error: \(error.localizedDescription)")
                }
            } catch {
                print("Unexpected error: \(error.localizedDescription)")
            }
        }
    }
    
    func filteredStores() throws -> [StoreType] {
        if searchText.isEmpty {
            return storeType
        }
        
         let filteredList = storeType.filter {
         $0.matches(query: searchText.lowercased())
         }
         
         if filteredList.isEmpty {
         throw SearchError.noResultsFound
         }
         
         return filteredList
        
        
    }
}

