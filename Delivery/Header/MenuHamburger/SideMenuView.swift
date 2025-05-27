//
//  SideMenuView.swift
//  Delivery
//
//  Created by Elis Pethke on 16/05/25.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
        ZStack {
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .leading, spacing: 20){
                Button(action: {
                    withAnimation {
                        isShowing = false
                        dismiss()
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .bold()
                }
                Text("About Chef- Delivery")
                    .font(.headline)
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                    .bold()
                
                Divider()
                
                NavigationLink(destination: AboutAppView()) {
                    Text("Copyright & Contact")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                
                HStack(spacing: 16){
                    Button(action: {
                        openURL("https://instagram.com")
                    }) {
                        Image(systemName: "camera")
                            .font(.title2)
                            .foregroundStyle(.black) // Ícone branco para contraste
                            .padding(12)
                            .background(.white)
                            .clipShape(Circle())
                        
                    }
                    
                    Button(action: {
                        openURL("mailto:seuemail@gmail.com")
                    }) {
                        Image(systemName: "envelope")
                            .font(.title2)
                            .foregroundStyle(.black)
                            .padding(12)
                            .background(.white)
                            .clipShape(Circle())
                        
                    }
                }
                
                .padding(.horizontal)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .shadow(radius: 5)
        }
    }
        
        
    }
    
    func openURL(_ urlString: String){
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    @Previewable @State var isShowing = true
    SideMenuView(isShowing: $isShowing)
    
    
}
