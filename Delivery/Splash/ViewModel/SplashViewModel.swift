//
//  SplashViewModel.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

class SplashViewModel: ObservableObject{
    @Published var isActive = false
    
    init(){
     startSplashTime()
    }
    func startSplashTime() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 1)){
                self.isActive = true
            }
        }
    }
}

