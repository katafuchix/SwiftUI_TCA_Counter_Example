//
//  SwiftUI_TCA_Counter_ExampleApp.swift
//  SwiftUI_TCA_Counter_Example
//
//  Created by cano on 2026/04/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct SwiftUI_TCA_Counter_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: CounterFeature.State()) {
                    CounterFeature()
                }
            )
        }
    }
}
