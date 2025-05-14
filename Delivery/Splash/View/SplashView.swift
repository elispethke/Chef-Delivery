//
//  ContentView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    @State private var isAnimation = false
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        
        ZStack {
            Color.colorOrange
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Chef Delivery")
                    .font(.system(size: 55))
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
                    .opacity(isAnimation ? 1 : 0)
                    .offset(y: isAnimation ? 0 : -40)
                    .padding(.top, 40)
                
                Text("Your personal chef, just a click away")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .background(Color.white)
                    .cornerRadius(5)
                    .foregroundStyle(Color.colorOrange)
                    .multilineTextAlignment(.center)
                    .opacity(isAnimation ? 1 : 0)
                    .offset(y: isAnimation ? 0 : -40)
                
                //Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(isAnimation ? 42 : 100)
                    .opacity(isAnimation ? 1 : 0)
                    .padding(.top, 60)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.easeInOut(duration: 1)){
                                    imageOffset = gesture.translation
                                }
                                
                            })
                            .onEnded({ _ in
                                withAnimation(.easeInOut(duration: 1)) {
                                    imageOffset = .zero
                                }
                            })
                    )
                
                Spacer()
            }
            .onAppear{
                withAnimation(.easeInOut(duration: 1.5)){
                    isAnimation = true
                }
            }
            .offset(x: viewModel.isActive ? -UIScreen.main.bounds.width : 0)
            .animation(.easeInOut(duration: 1), value: viewModel.isActive)
        }
        
        .fullScreenCover(isPresented: $viewModel.isActive){
            HomeView()
            
        }
    }
}

#Preview {
    SplashView()
}
