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
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationBar()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20){
                        OrderTypeGridView()
                        CarrouselTabView()
                        StoreContainerView(stores: storesType)
                        
                    }
                }
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

