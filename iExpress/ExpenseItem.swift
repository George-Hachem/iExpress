//
//  ExpenseItem.swift
//  iExpress
//
//  Created by George on 5/29/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
