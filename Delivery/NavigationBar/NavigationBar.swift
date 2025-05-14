//
//  NavigationBar.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.colorScheme) var colorSheme
    var body: some View {
        HStack{
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Frankfurter Allee 120")
                    .font(.headline)
                    .foregroundStyle(colorSheme == .dark ? .white : .black)
            }
         
            
            Spacer()
        
            Button( action: {
                
            }) {
                Image(systemName: "bell.badge")
                    .font(.system(size: 22))
                    .foregroundStyle(.accent)
                    .fontWeight(.bold)
                    .padding()
                   
            }
        }
        Spacer()
    }
}

#Preview {
    NavigationBar()
}

