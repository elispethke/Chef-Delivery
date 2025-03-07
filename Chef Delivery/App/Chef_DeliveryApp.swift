//
//  Chef_DeliveryApp.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 02/01/25.
//
import SwiftUI
import Firebase


@main
struct Chef_DeliveryApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    // Aqui você pode adicionar os métodos de ciclo de vida do aplicativo
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Configuração inicial do aplicativo
        return true
    }
}

