//
//  ItemDetails.swift
//  StMenu
//
//  Created by Efe Soydas on 18.07.2023.
//

import SwiftUI

struct ItemDetails: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .background(.black)
                    .padding(4)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                
            }
            Text(item.description)
                .padding()
            
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
            
            
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: MenuItem.example)
            .environmentObject(Order())
    }
}
