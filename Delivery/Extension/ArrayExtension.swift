//
//  ArrayExtension.swift
//  Delivery
//
//  Created by Elis Pethke on 19/06/25.
//

import Foundation

extension Array: Searchable where Element == String {
    func matches(query: String) -> Bool {
        return contains(where: {$0.lowercased().hasPrefix(query)})
    }
}


