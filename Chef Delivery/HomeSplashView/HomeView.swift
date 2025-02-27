//
//  ContentView.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 02/01/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationBar()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20){
                        OrderTypeGridView()
                        CarrouselTabView()
                        StoreContainerView()
                           
                    }
                }
                
            }
            
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            
            
        }
       // .onAppear{
       //  fetchData()
      //  }
        
        
    }
    
   /* func fetchData() {
        guard let url = URL(string: "https://polls.apiblueprint.org/home") else{
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let storesObjects = try? JSONDecoder().decode([StoreType].self, from: data)
                print(storesObjects)
            }
        }
        .resume()
   } */
}

#Preview {
    HomeView()
}
