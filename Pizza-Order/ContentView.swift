//
//  ContentView.swift
//  Pizza-Order
//
//  Created by mo aabas on 4/25/23.
//

import SwiftUI

struct ContentView: View {
    enum PizzaSize: String, CaseIterable, Identifiable {
        case eight, twelve, twenty
        var id: Self { self }
    }
    @State var selectedSize: PizzaSize = .twelve
    @State var inputName = ""
    @State var inputAddress = ""
    @State var isVegetarian = false
    @State var forPickup = false
    
    var body: some View {
        Form {
            Section(header: Text("Your Name & Address")) {
                TextField("Name", text: $inputName)
                TextField("Address", text: $inputAddress)
            }
            Section(header: Text("Delivery or Pickup?")) {
                Toggle("For Pickup", isOn: $forPickup)
            }
            Section(header: Text("Size of Pizza & If Vegetarian")) {
                Picker("Pizza Size", selection: $selectedSize, content: {
                    Text("8\"").tag(PizzaSize.eight)
                    Text("12\"").tag(PizzaSize.twelve)
                    Text("20\"").tag(PizzaSize.twenty)
                })
                .pickerStyle(SegmentedPickerStyle())
                Toggle("Vegetarian", isOn: $isVegetarian)
            }
            Section(header: Text("Summary of Order")) {
                Text("\(inputName) Ordered")
                Text("\(selectedSize.rawValue) Inch Pizza")
                Text("Is Vegetarian \(isVegetarian ? "Yes" : "No")")
            }
            Section {
                Button("Place Your Order") {
                    
                }
            }
        }
    }
}
