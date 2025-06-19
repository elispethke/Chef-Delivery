//
//  HomeView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//
import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    private var service = HomeService()
    @State private var storesType : [StoreType] = []
    @State private var isLoading: Bool = true
    @State private var searchText = ""
    
    @StateObject var cartViewModel = CartViewModel()
    
    var body: some View {
        
        NavigationStack {
            TabView {
                VStack {
                    NavigationBar()
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 20){
                            
                            OrderTypeGridView()
                            CarrouselTabView()
                            StoreContainerView(cartViewModel: cartViewModel, stores: storesType)
                            
                        }
                    }
                    Spacer()
                    
                }
                .tabItem({
                    Image(systemName: "house")
                    Text("Start")
                })
                
                SearchStoreView(viewModel: SearchStoreViewModel(service: SearchService()))
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Busca")
                        
                    }
                
                CartView(viewModel: cartViewModel)
                    .tabItem {
                        Image(systemName: "cart")
                              Text("Cart")
                    }
                    .badge(cartViewModel.items.count)
            }
            
            .foregroundStyle(colorScheme == .dark ? .white : .black)
        }
        .onAppear{
            Task{
                await getStore()
            }
            // Descomentar esse codigo caso eu use o Alamofire no futuro
           // getStoreWithAlamofire()
        }
    }
    
    
    func getStore() async {
        do{
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Codigo para usar o Alamofire
     /*
     
    func getStoreWithAlamofire() {
        service.fetchDataWithAlamofire { stores, error in
            print( stores)
        }
    }
      */
}

#Preview {
    HomeView()
}

