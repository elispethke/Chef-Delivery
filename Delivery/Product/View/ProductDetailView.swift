//
//  ProductDetailView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State var productQuantity = 1
    @State private var selectedExtras: Set<String> = []
    @Environment(\.colorScheme) var colorScheme
    var service = HomeService()
    
    var body: some View {
        ZStack{
            VStack{
                ProductDetailHeaderView(product: product)
                
                
                
                Spacer()
                
                ProductDetailQuantityView(productQuantity: $productQuantity)
                
                Text("Total: \(product.totalPrice(for: productQuantity))")
                    .font(.headline)
                    .foregroundStyle(Color.red)
                    .bold()
                    .padding(.bottom,30)
                
                Spacer()
                
                ProductDetailButton{
                    Task {
                        await confirOrder()
                    }
                }
                .padding(.bottom,40)
                
            }
        }
    }
    
    func confirOrder() async {
        do{
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
}

#Preview {
    let viewModel = StoreViewModel()
    ProductDetailView(product: viewModel.storeMock[0].product![0])
}
