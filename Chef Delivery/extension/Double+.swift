//
//  Double+.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 30/01/25.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
