//
//  StoreType.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import Foundation

protocol Searchable {
    func matches(query: String) -> Bool
}

struct StoreType: Identifiable, Decodable {
    let id: Int
    let name: String
    let logoImage: String?
    let headerImage: String?
    let location: String
    let stars: Int
    let deliveryTime: String?
    let rating: Double?
    let reviewCount: Int?
    let products: [ProductType]?
    let specialties: [String]?
    let deliveryPrice: Double?
    
    init(id: Int, name: String, logoImage: String?, headerImage: String?, location: String, stars: Int, deliveryTime: String?, rating: Double?, reviewCount: Int?, products: [ProductType]?, specialties: [String]?, deliveryPrice: Double?) {
        self.id = id
        self.name = name
        self.logoImage = logoImage
        self.headerImage = headerImage
        self.location = location
        self.stars = stars
        self.deliveryTime = deliveryTime
        self.rating = rating
        self.reviewCount = reviewCount
        self.products = products
        self.specialties = specialties
        self.deliveryPrice = deliveryPrice
    }
    
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location, stars, products, specialties,reviewCount,deliveryPrice,rating,deliveryTime
        case logoImage = "logo_image"
        case headerImage = "header_image"
    }
}

/*
 extension String: Searchable {
     func matches(query: String) -> Bool {
         return self.lowercased().contains(query.lowercased())
     }
 }
 */

extension StoreType: Searchable {
    func matches(query: String) -> Bool {
        var parameters: [Searchable] = [name]
        
        if let specialties = specialties {
            parameters.append(contentsOf: specialties)
        }
        
        return parameters.contains(where: { $0.matches(query: query) })
    }
}

    
    
    /*
    enum CodingKeys: String, CodingKey{
        
        case id
        case name
        case logoImage = "logo_image"
        case headerImage = "header_image"
        case location
        case stars
        case deliveryTime = "delivery_time"
        case rating
        case reviewCount = "review_count"
        case product = "products"
        case deliveryPrice = "delivery_price"
    }
   
}
     */

