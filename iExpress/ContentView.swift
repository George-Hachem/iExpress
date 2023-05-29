//
//  ContentView.swift
//  iExpress
//
//  Created by George on 5/28/23.
//

import SwiftUI



struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
   
        var body: some View {
            NavigationView {
                List {
                    ForEach(expenses.items, id: \.id) { item in
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.name).font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).foregroundStyle(item.amount <= 10 ? .red : (10 < item.amount && item.amount <= 100 ? .teal : .orange))
                        }
                    }.onDelete(perform: removeItems)
                }
                .navigationTitle("iExpense")
                .toolbar {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $showingAddExpense){
                    AddView(expenses: expenses)
                }
            }
        }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
