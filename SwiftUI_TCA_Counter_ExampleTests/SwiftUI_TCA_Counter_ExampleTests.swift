//
//  SwiftUI_TCA_Counter_ExampleTests.swift
//  SwiftUI_TCA_Counter_ExampleTests
//
//  Created by cano on 2026/04/23.
//

import ComposableArchitecture
import Testing
@testable import SwiftUI_TCA_Counter_Example

@MainActor  // TCAの TestStore 自体が @MainActor で動く設計
struct SwiftUI_TCA_Counter_ExampleTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        // Swift Testing Documentation
        // https://developer.apple.com/documentation/testing
    }

    @Test
    func increment() async throws {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }

        await store.send(.incrementButtonTapped) {
            // Actionを送った後、Stateがこう変わるはず、という期待値を書く
            $0.count = 1
        }
    }
    
    @Test
    func decrement() async throws {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }

        await store.send(.decrementButtonTapped) {
            $0.count = -1
        }
    }
}
