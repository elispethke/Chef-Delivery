//
//  Double .swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
