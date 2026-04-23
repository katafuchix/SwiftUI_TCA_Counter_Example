//
//  ContentView.swift
//  SwiftUI_TCA_Counter_Example
//
//  Created by cano on 2026/04/23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - View
struct ContentView: View {
    // 4. Store: State・Action・Reducer をつなぐ
    let store: StoreOf<CounterFeature>

    var body: some View {
        VStack(spacing: 20) {
            Text("\(store.count)")
                .font(.system(size: 64, weight: .medium))

            HStack(spacing: 16) {
                Button("−") {
                    store.send(.decrementButtonTapped)
                }
                .font(.title)

                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .font(.title)
            }
        }
    }
}

#Preview {
    ContentView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
        }
    )
}
