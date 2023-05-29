//
//  Expenses.swift
//  iExpress
//
//  Created by George on 5/29/23.
//

import Foundation

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem](){
        didSet{
            let encoder = JSONEncoder()
            
            if let encoded = try?encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Item")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Item"){
            
            //The .self in [ExpenseItem].self means that we want the original array not a copy
            if let decodeItems = try?JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodeItems
                return
            }
        }
        items = []
    }
}
