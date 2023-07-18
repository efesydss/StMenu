//
//  StMenuApp.swift
//  StMenu
//
//  Created by Efe Soydas on 17.07.2023.
//

import SwiftUI

@main
struct StMenuApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
