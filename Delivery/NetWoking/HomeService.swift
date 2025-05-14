//
//  HomeService.swift
//  Delivery
//
//  Created by Elis Pethke on 14/05/25.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest (error: String)
}

struct HomeService {
    func fetchData() async -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-e643f3-elispethke.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Printar o JSON para debug
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON recebido:\n\(jsonString)")
            }

            let decoder = JSONDecoder()
            let storeObject = try decoder.decode([StoreType].self, from: data)
            return .success(storeObject)
        } catch {
            debugPrint("Erro ao decodificar JSON: \(error)")
            return .failure(.errorRequest(error: error.localizedDescription))
        }
    }
    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError>{
        guard let url = URL(string: "https://private-e643f3-elispethke.apiary-mock.com/home") else{
            return .failure(.invalidURL)
        }
        let encodeObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodeObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
    }
        
    
    // I will leave the code written  so that I can use Alamofire in the future.
    
    /*
    func fetchDataWithAlamofire(completion: @escaping ([StoreType]?, Error) -> Void)
    AF.request("https://private-e643f3-elispethke.apiary-mock.com/home").responseDecodable(of:[StoreType].self) { response in
        switch response.result {
        case .success(let stores):
            completion(stores, nil)
        default: braak
        }
    }
     */
    
}

/*
struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-e643f3-elispethke.apiary-mock.com/home") else{
            return .failure(.invalidURL)
        }
         
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let ( data, response) = try await URLSession.shared.data(for: request)
        let storeObject = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storeObject)
   }
}
*/


/*
URLSession.shared.dataTask(with: url) { data, _, error in
    if let error = error {
        print(error.localizedDescription)
    }
    else if let data = data {
        let storesObjects = try? JSONDecoder().decode([StoreType].self, from: data)
        print(storesObjects as Any)
    }
}
.resume()
 */
