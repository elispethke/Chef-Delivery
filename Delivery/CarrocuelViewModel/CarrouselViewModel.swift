//
//  CarrouselViewModel.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//


import Foundation

class CarrouselViewModel: ObservableObject {
    @Published var currentIndex = 1
    
    @Published var ordersMock: [OrderType] = [
        OrderType(id: 1, name: "banne barcecue", image: "barbecue-banner"),
        OrderType(id: 2, name: "banne brazilian food", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "banne pokes", image: "pokes-banner"),
    
        
    ]
}
