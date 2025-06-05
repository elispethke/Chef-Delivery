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
    @ObservedObject var cartViewModel: CartViewModel
    
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
                
                ProductDetailButton {
                    Task {
                        let item = CartItem(name: product.name, price: product.price, quantity: productQuantity)
                        cartViewModel.addToCart(item: item)
                        await confirOrder()
                        
                    }
                }
                .padding(.bottom,40)
            }
        }
    }
    
    func confirOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    let viewModel = StoreViewModel()
    let cartViewModel = CartViewModel()
    ProductDetailView(product: viewModel.storeMock[0].products![0], cartViewModel: CartViewModel())
}
