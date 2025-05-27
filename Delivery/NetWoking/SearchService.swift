//
//  SearchService.swift
//  Delivery
//
//  Created by Elis Pethke on 20/05/25.
//

import Foundation

struct SearchService {
    
    func fetData() async throws -> Result <[StoreType], RequestError> {
        guard let url = URL(string: "https://private-e643f3-elispethke.apiary-mock.com/search") else{
            return .failure(.invalidURL)
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObject = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObject)
    }
    
}
