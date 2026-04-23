//
//  CounterFeature.swift
//  SwiftUI_TCA_Counter_Example
//
//  Created by cano on 2026/04/23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Feature (State + Action + Reducer をまとめる)
@Reducer
struct CounterFeature {

    // 1. State: 画面が持つデータ
    @ObservableState
    struct State: Equatable {
        var count = 0
    }

    // 2. Action: 起こりうる操作
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
    }

    // 3. Reducer: Action を受け取って State を更新するロジック
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .incrementButtonTapped:
                state.count += 1
                return .none  // 副作用なし
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            }
        }
    }
}

