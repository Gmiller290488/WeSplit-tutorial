//
//  ContentView.swift
//  WeSplit
//
//  Created by Spare on 27/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var peopleCount: Double {
        Double(numberOfPeople) ?? 0
    }
    
    var totalPerPerson: Double {
        print(totalWithTip)
        print(peopleCount)
        return totalWithTip / peopleCount
    }
    
    var totalWithTip: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipAmount = orderAmount / 100 * tipSelection
        return orderAmount + tipAmount
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Bill Amount")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                 Section(header: Text("Number of People")) {
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)

                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total bill amount with tip")) {
                    Text("$\(totalWithTip, specifier: "%.2f")")
                        .foregroundColor(self.tipPercentages[tipPercentage] == 0 ? Color.red : Color.black)
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
