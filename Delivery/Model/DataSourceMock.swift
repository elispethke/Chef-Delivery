//
//  DataSourceMock.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//


import Foundation

let ordersMock: [OrderType] = [
    OrderType(id: 1, name: "Burger", image: "hamburguer1"),
    OrderType(id: 2, name: "Bakery", image: "mercado1"),
    OrderType(id: 3, name: "Soft drinks", image: "farmacia1"),
    OrderType(id: 4, name: "Restaurant", image: "restaurante"),
    OrderType(id: 5, name: "Descontos", image: "descontos1"),
    OrderType(id: 6, name: "Drinks", image: "bebidas1"),
    OrderType(id: 7, name: "Asian food", image: "gourmet1"),
]

let storesMock: [StoreType] = [
    StoreType(
        id: 1,
        name: "Monstro Burger",
        logoImage: "monstro-burger-logo",
        headerImage: "monstro-burger-header",
        location: "Rua Principal, 123, São Paulo, SP",
        stars: 4,
        deliveryTime: "30-40 min",
        rating: 4.5,
        reviewCount: 120,
        products: [
            ProductType(id: 1, name: "Hambúrguer Clássico", description: "Hambúrguer de carne com queijo, alface e tomate", image: "classic_burger", price: 14.99),
            ProductType(id: 2, name: "Hambúrguer com Bacon", description: "Hambúrguer de carne com queijo, bacon crocante, alface e tomate", image: "bacon_burger", price: 16.99),
            ProductType(id: 3, name: "Batatas Fritas", description: "Porção de batatas fritas crocantes", image: "fries", price: 5.99),
            ProductType(id: 4, name: "Refrigerante", description: "Lata de refrigerante de 355ml", image: "soda", price: 3.99),
            ProductType(id: 5, name: "Sorvete de Baunilha", description: "Copo de sorvete de baunilha", image: "vanilla_ice_cream", price: 4.99)
        ], specialties: [""],
        deliveryPrice: 5.99
    ),
    StoreType(
        id: 2,
        name: "Food Court",
        logoImage: "food-court-logo",
        headerImage: "food-court-header",
        location: "Avenida Secundária, 456, São Paulo, SP",
        stars: 4,
        deliveryTime: "25-35 min",
        rating: 4.7,
        reviewCount: 98,
        products: [
            ProductType(id: 6, name: "Pizza Margherita", description: "Pizza com molho de tomate, queijo mozzarella e manjericão", image: "margherita_pizza", price: 18.99),
            ProductType(id: 7, name: "Pizza Pepperoni", description: "Pizza com molho de tomate, queijo mozzarella e pepperoni", image: "pepperoni_pizza", price: 19.99),
            ProductType(id: 8, name: "Pizza Quatro Queijos", description: "Pizza com queijo mozzarella, provolone, parmesão e gorgonzola", image: "four_cheeses_pizza", price: 21.99),
            ProductType(id: 9, name: "Lasanha à Bolonhesa", description: "Lasanha com molho à bolonhesa, queijo e béchamel", image: "lasagna", price: 22.99),
            ProductType(id: 10, name: "Espaguete à Carbonara", description: "Espaguete com molho carbonara", image: "spaghetti_carbonara", price: 20.99)
        ], specialties: [""],
        deliveryPrice: 4.99
    )
]
