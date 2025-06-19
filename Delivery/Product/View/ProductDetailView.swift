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
    @Environment(\.colorScheme) var colorScheme
    var service = HomeService()
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            VStack {
                ProductDetailHeaderView(product: product)
                
                Spacer()
                
                ProductDetailQuantityView(productQuantity: $productQuantity)
                
                Text("Total: \(product.totalPrice(for: productQuantity))")
                    .font(.headline)
                    .foregroundStyle(Color.red)
                    .bold()
                    .padding(.bottom, 30)
                
                Spacer()
                
                ProductDetailButton {
                    Task {
                        let item = CartItem(name: product.name, price: product.price, quantity: productQuantity)
                        cartViewModel.addToCart(item: item)
                        await confirOrder()
                        isPresented = false
                    }
                }
                .padding(.bottom, 40)
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(.gray)
                            .padding()
                    }
                }
                Spacer()
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
    ProductDetailView(product: viewModel.storeMock[0].products![0], cartViewModel: CartViewModel(), isPresented: .constant(false))
}
