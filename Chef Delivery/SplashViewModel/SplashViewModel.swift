//
//  SplashViewModel.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 21/02/25.
//

import SwiftUI

class SplashViewModel: ObservableObject{
    @Published var isActive = false
    
    init(){
     startSplashTime()
    }
    func startSplashTime() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            withAnimation(.easeInOut(duration: 1)){
                self.isActive = true
            }
        }
    }
}

