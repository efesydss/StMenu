//
//  CheckoutView.swift
//  StMenu
//
//  Created by Efe Soydas on 18.07.2023.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    let tipAmounts = [10, 15,20,25,0]
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    var totalPrice: String{
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section{
                Picker("How do you want pay?",selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails)
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
               
                
            }
            Section("Add a tip?"){
                Picker("Percentage:",selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)%")
                        
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total: \(totalPrice)"){
                Button("Confirm Order"){
                    //place the order
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
            //buttons here
            
        } message: {
            Text("Your total was \(totalPrice) - thank you :) ")
            
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
