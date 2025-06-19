//
//  StringExtension.swift
//  Delivery
//
//  Created by Elis Pethke on 19/06/25.
//

import Foundation

extension String: Searchable {
    func matches(query: String) -> Bool {
        return self.lowercased().hasPrefix(query)
    }
}
