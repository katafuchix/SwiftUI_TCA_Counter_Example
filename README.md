# SwiftUI_TCA_Counter_Example

TCAは以下の5つの要素でアプリを構成します。
###  1. State（状態）
画面やロジックが持つデータ。struct で定義します

```
struct CounterState: Equatable {
    var count = 0
}
```

### 2. Action（アクション）
ユーザー操作やシステムイベントを表す enum。

```
enum CounterAction {
    case increment
    case decrement
}
```

### 3. Reducer（リデューサー）

```
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
```

### 4. Store（ストア）
State・Action・Reducerをまとめた「単一の真実の源」。Viewはここを参照します。

```
Store(initialState: CounterFeature.State()) {
  CounterFeature()
}
```

### データフローのイメージ
```
[View] ---(Action)---> [Store/Reducer] ---(新しいState)---> [View]
                              |
                         [Effect]
                         (API通信など)
```

| メリット |説明 | 
|:-----------|------------:|
| テストしやすい    |StateとActionが明確なので、ロジックのユニットテストが書きやすい| 
| 単方向データフロー    |View → Action → Reducer → State → View の流れが明確| 
| モジュール分割    |大きなアプリを小さなReducerに分割して合成できる| 
| デバッグしやすい    |状態変化の追跡が容易|



