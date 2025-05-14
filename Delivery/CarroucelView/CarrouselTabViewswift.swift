//
//  CarrouselTabViewswift.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct CarrouselTabView: View {
    
    @StateObject var viewModel = CarrouselViewModel()
   
    var body: some View {
        TabView(selection: $viewModel.currentIndex){
            ForEach(viewModel.ordersMock) { mock in
                CarrouselItemView(order: mock)
                    .tag(mock.id)
            }
        }
        .frame(height: 320)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                
                withAnimation(.easeInOut(duration: 1)) {
                    if viewModel.currentIndex > viewModel.ordersMock.count {
                        viewModel.currentIndex = 1
                    }
                    viewModel.currentIndex += 1
                }
                
                
            }
        }
    }
}

#Preview {
    CarrouselTabView()
}
