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
