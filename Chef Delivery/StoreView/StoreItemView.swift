//
//  StoreItemView.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 14/01/25.
//

import SwiftUI

struct StoreItemView: View {
    let store: StoreType
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                VStack {
                    VStack {
                        GeometryReader { geometry in
                            Image(store.logoImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height )
                                .clipped()
                        }
                        .frame(height: 150)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(store.name)
                                    .fontWeight(.bold)
                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                
                                HStack{
                                    ForEach(1...store.stars, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(Color.accent)
                                            .font(.system(size: 10))
                                        
                                    }
                                    
                                }
                                
                                HStack{
                                    Image(systemName: "hand.thumbsup")
                                    
                                    
                                    Text("\(String(format: "%.1f", store.rating)) (\(store.reviewCount > 200 ? "200+" : "\(store.reviewCount)"))")
                                    
                                    HStack{
                                        Image(systemName: "bicycle")
                                            .foregroundStyle(Color.white)
                                        
                                        Text(store.deliveryPrice == 0 ? "Free delivery" : "Delivery: €\(String(format: "%.2f", store.deliveryPrice))")
                                            .foregroundStyle(Color.white)
                                        
                                        
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 12)
                                    .background(Color.accentColor)
                                    .cornerRadius(12)
                                    .padding(.horizontal, 40)
                                    
                                    
                                    
                                    
                                }
                                .font(.system(size: 15))
                                .padding(.leading,2)
                                
                                
                                HStack{
                                    Image(systemName: "clock")
                                        .foregroundStyle(Color.grayD)
                                        .font(.system(size: 15))
                                        .padding(.top,10)
                                    
                                    Text(store.deliveryTime)
                                        .font(.system(size: 15))
                                        .foregroundStyle(Color.grayD)
                                        .padding(.top,10)
                                    
                                    
                                    
                                }
                                .padding(.bottom,5)
                                
                            }
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .frame(width: 370, height: 280)
                    .background(colorScheme == .dark ? .myBlack.opacity(0.1) : .white.opacity(0.2))
                    .cornerRadius(20)
                    .shadow(color: colorScheme == .dark ? Color.white.opacity(0.4) : Color.black.opacity(0.4), radius: 2, x: 1, y: 2)
                    
                }
                .padding(.horizontal, 10)
            }
            
        }
    }
    
}
#Preview {
    StoreItemView(store: StoreViewModel().storeMock[0])
}
