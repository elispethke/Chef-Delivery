//
//  PaymenView.swift
//  Delivery
//
//  Created by Elis Pethke on 28/05/25.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.dismiss) var dismiss
    
    enum paymentMethod: String, CaseIterable, Identifiable {
        case creditCard = "Credit card"
        case debitCard = " Debit card"
        case paypal = "paypal"
        case cash = "Cash"
        var id: String {self.rawValue}
    }
    
    @State private var selectedMethod: paymentMethod = .creditCard
    
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Choose payment Method")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Picker("Payment Method", selection:  $selectedMethod) {
                ForEach(paymentMethod.allCases) { method in
                    Text(method.rawValue).tag(method)
                }
            }
            .pickerStyle(.segmented)
            .background(Color.accentColor)
            .cornerRadius(8)
            .padding()
            
            Button("Confirm Payment"){
                //
                print("Confirmed payment with \(selectedMethod.rawValue)")
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle("Payment")
    }
}

#Preview {
    PaymentView()
}
