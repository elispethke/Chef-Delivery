//
//  StoreDateilHeaderView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct StoreDateilHeaderView: View {
    let store: StoreType
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack{
            Image(store.headerImage ?? "")
                .resizable()
                .scaledToFit()
              
            HStack {
                Text(store.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                Spacer()
                
                Image(store.logoImage!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)

            HStack {
                Text(store.location)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)

                ForEach(1...(store.stars), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.accentColor)
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }
}

#Preview {
    let viewModel = StoreViewModel()
    StoreDateilHeaderView(store: viewModel.storeMock[0])
}
