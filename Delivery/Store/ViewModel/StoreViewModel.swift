//
//  StoreViewModel.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import Foundation

class StoreViewModel: ObservableObject {
     var title = "Store"
    @Published var ratingFilter = 0
    
    var stores: [StoreType] = []
    
    var filteredStores:[StoreType] {
        storeMock.filter { store in
            store.stars >= ratingFilter
        }
    }
     
    
    @Published var storeMock: [StoreType] = [
        StoreType(
                id: 1,
                name: "Monster Burger",
                logoImage: "monster-burger1",
                headerImage: "monstro-burger-header",
                location: "Franfurter Allee 90, 10247 Berlin",
                stars: 4, deliveryTime: "30-40 min",
                rating: 4.3,
                reviewCount: 200,
                products: [
                    ProductType(id: 1, name: "Classic Burger", description: "Beef burger with cheese, lettuce and tomato", image: "classic_burger", price: 14.99),
                    ProductType(id: 2, name: "Burger with Bacon", description: "Beef burger with cheese, crispy bacon, lettuce and tomato", image: "bacon_burger", price: 16.99),
                    ProductType(id: 3, name: "French fries", description: "Portion of crispy French fries", image: "fries", price: 5.99),
                    ProductType(id: 4, name: "Soft drinks", description: "355ml soft drink can", image: "soda", price: 3.99),
                    ProductType(id: 5, name: "Vanilla ice cream", description: "Cup of vanilla ice cream", image: "vanilla_ice_cream", price: 4.99),
                ], specialties: [""], deliveryPrice: 0
            ),
            StoreType(
                id: 2,
                name: "Food Court",
                logoImage: "food-court-logo",
                headerImage: "food-court-header",
                location: "Oderstrasse 14, 10247 Berlin",
                stars: 4, deliveryTime: "20-30min",
                rating: 4.7,
                reviewCount: 325,
                products: [
                    ProductType(id: 6, name: "Pizza Margherita", description: "Pizza with tomato sauce, mozzarella cheese and basil", image: "margherita_pizza", price: 18.99),
                    ProductType(id: 7, name: "Pizza Pepperoni", description: "Pizza with tomato sauce, mozzarella cheese and pepperoni", image: "pepperoni_pizza", price: 19.99),
                    ProductType(id: 8, name: "Pizza Four Cheese", description: "Pizza with mozzarella cheese, provolone, parmesan and gorgonzola", image: "four_cheeses_pizza", price: 21.99),
                    ProductType(id: 9, name: "Lasagna Bolognese", description: "Lasagna with bolognese sauce, cheese and béchamel", image: "lasagna", price: 22.99),
                    ProductType(id: 10, name: "Spaghetti Carbonara", description: "Spaghetti with carbonara sauce", image: "spaghetti_carbonara", price: 20.99)
                ], specialties: [""], deliveryPrice: 199
            ),
            StoreType(
                id: 3,
                name: "Carbron",
                logoImage: "carbron-logo",
                headerImage: "carbron-header",
                location: "Weserstrasse 189, 10248 Berlin",
                stars: 4, deliveryTime: "10-20min",
                rating: 5.3,
                reviewCount: 525,
                products: [
                    ProductType(id: 11, name: "Rump steak", description: "Grilled picanha served with rice, farofa and vinaigrette", image: "picanha", price: 29.99),
                    ProductType(id: 12, name: "Smoked ribs", description: "Delicious slow-roasted prime rib served with potatoes", image: "ribs", price: 26.99),
                    ProductType(id: 13, name: "Fraldinha", description: "Grilled sirloin served with rice, farofa and vinaigrette", image: "fraldinha", price: 27.99),
                    ProductType(id: 14, name: "Maminha", description: "Grilled breast served with rice, farofa and vinaigrette", image: "maminha", price: 28.99),
                    ProductType(id: 15, name: "Churrasco Misto", description: "Mixed barbecue with sausage, chicken and beef, served with rice, farofa and vinaigrette", image: "mixed_grill", price: 34.99)
                ], specialties: [""], deliveryPrice: 0
            ),
            StoreType(
                id: 4,
                name: "Bakery",
                logoImage: "bakery-logo",
                headerImage: "bakery-header",
                location: "Weichselstrasse 159, 10247 Berlin",
                stars: 3, deliveryTime: "15-30min",
                rating: 3.5,
                reviewCount: 85,
                products: [
                    ProductType(id: 16, name: "Bread ", description: "Fresh French bread", image: "french_bread", price: 0.50),
                    ProductType(id: 17, name: "Croissant", description: "Puff pastry croissant", image: "croissant", price: 2.99),
                    ProductType(id: 18, name: "Sweet bread roll", description: "Sweet bread roll with sugar icing", image: "sweet_bread", price: 3.99),
                    ProductType(id: 19, name: "Chocolate cake", description: "Piece of chocolate cake", image: "chocolate_cake_slice", price: 4.99),
                    ProductType(id: 20, name: "Coffee", description: "Hot coffee", image: "coffee", price: 1.99)
                ], specialties: [""], deliveryPrice: 2.30
            ),
            StoreType(
                id: 5,
                name: "Açaí Panda",
                logoImage: "acai-panda-logo",
                headerImage: "acai-panda-header",
                location: "Avenida Quinta, 753, São Paulo, SP",
                stars: 4, deliveryTime: "15.20min",
                rating: 4.4,
                reviewCount: 200,
                products: [
                    ProductType(id: 21, name: "Açaí small", description: "Açaí in a 300ml bowl with granola and banana", image: "small_acai", price: 8.99),
                    ProductType(id: 22, name: "Açaí Medium", description: "Açaí in a 500ml bowl with granola, banana and condensed milk", image: "medium_acai", price: 10.99),
                    ProductType(id: 23, name: "Açaí Big", description: "Açaí in a 700ml bowl with granola, banana, condensed milk and strawberries", image: "large_acai", price: 13.99),
                    ProductType(id: 24, name: "Strawberry Smoothie", description: "Strawberry smoothie made with natural yogurt", image: "strawberry_smoothie", price: 6.99),
                    ProductType(id: 25, name: "Banana and Cocoa Smoothie", description: "Banana and cocoa smoothie made with natural yogurt", image: "banana_cocoa_smoothie", price: 6.99)
                ], specialties: [""], deliveryPrice: 1.99
            ),
        
    ]
}

