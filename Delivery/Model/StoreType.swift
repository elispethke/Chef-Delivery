//
//  StoreType.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import Foundation

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
       let product: [ProductType]?
       let deliveryPrice: Double?
    
    
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


