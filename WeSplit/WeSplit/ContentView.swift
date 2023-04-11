//
//  ContentView.swift
//  WeSplit
//
//  Created by Randy Peralta on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    var totalPerPerson: (perPerson: Double, grandTotal: Double) {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return (amountPerPerson, grandTotal)
    }
    var body: some View {
        NavigationView{
            Form{
                
                Section {
                    TextField("Amount", value: $checkAmount, format: localCurrency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 16) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< 101) {
                            Text($0, format: .percent)
                        }
                    }
                    
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson.grandTotal, format: localCurrency)
                } header: {
                    Text("Total amount for the check")
                }
                
                Section {
                    Text(totalPerPerson.perPerson, format: localCurrency)
                } header: {
                    Text("Amount per person")
                }
                
               
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
