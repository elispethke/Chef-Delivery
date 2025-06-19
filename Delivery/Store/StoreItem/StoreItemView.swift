//
//  StoreItemView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct StoreItemView: View {
    let store: StoreType
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                StoreCard(store: store, colorScheme: colorScheme)
            }
            .padding(.zero)
            .padding()
        }
    }
}

struct StoreCard: View {
    let store: StoreType
    let colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            StoreImage(imageName: store.logoImage ?? "")
            
            StoreDetails(store: store, colorScheme: colorScheme)
        }
        .frame(width: 350, height: 260)
        .background(colorScheme == .dark ? Color.black : Color.brancoGelo)
        .cornerRadius(20)
        .shadow(color: colorScheme == .dark ? Color.white : Color.black, radius: 1, x: 0, y: 0)
    }
}

struct StoreImage: View {
    let imageName: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
              
        }
        .frame(height: 160)
    }
}

struct StoreDetails: View {
    let store: StoreType
    let colorScheme: ColorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(store.name)
                .fontWeight(.bold)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .padding(.leading, 5)
            
            StoreRating(stars: store.stars)
            
            HStack {
                Image(systemName: "hand.thumbsup")
                Text("\(String(format: "%.1f", store.rating!)) (\(((store.reviewCount ??  200) != 0) ? "200+" : "\(store.reviewCount)"))")
            }
            .font(.system(size: 15))
            .padding(.leading, 5)
            
            HStack{
                StoreDeliveryInfo(store: store)
                
                StoreTimeInfo(time: store.deliveryTime!)
            }
            .padding(.bottom, 1)
        }
        .padding(.horizontal)
    }
}

struct StoreRating: View {
    let stars: Int
    
    var body: some View {
        HStack {
            ForEach(1...stars, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundStyle(Color.accentColor)
                    .font(.system(size: 10))
                    
                    
                   
            }
        }
        .padding(.leading, 10)
    }
}

struct StoreDeliveryInfo: View {
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(systemName: "bicycle")
                .foregroundStyle(Color.accent)
            
            Text(store.deliveryPrice == 0 ? "Free delivery" : "Delivery: €\(String(format: "%.2f", store.deliveryPrice!))")
                .foregroundStyle(Color.accent)
               
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 12)
        //.background(Color.accentColor)
        .cornerRadius(12)
        .padding(.horizontal, 40)
    }
}

struct StoreTimeInfo: View {
    let time: String
    var body: some View {
        HStack {
            Image(systemName: "clock")
                .foregroundStyle(Color.accent)
                .font(.system(size: 15))
                .padding(.leading, -30)
            
            Text(time)
                .font(.system(size: 15))
                .foregroundStyle(Color.accent)
                .padding(.top, 2)
                .padding(.leading, -20)
        }
        .padding(.bottom, 2)
    }
    
    
}

#Preview {
    StoreItemView(store: StoreViewModel().storeMock[0])
}
