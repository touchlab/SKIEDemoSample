//
//  iosApp.swift
//  ios
//
//  Created by Kevin Galligan on 5/16/23.
//

import SwiftUI

@main
struct iosApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CalculatorView()
                    .tabItem {
                        Label("Calculator", systemImage: "plus")
                    }
                TickView()
                    .tabItem {
                        Label("Tick", systemImage: "clock")
                    }
                ChatRoomView()
                    .tabItem {
                        Label("Solo Chat", systemImage: "message")
                    }
            }
        }
    }
}
