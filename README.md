

# 概要
LazyVStackで、Equatableな要素View内に実装したボタンタップ時に要素ごとに渡されたオブジェクトにアクセスすると意図しない他のオブジェクトになっている現象の調査解決

# 暫定の結論

Xcode15からLazyVStack内の要素が再利用される挙動っぽくて、その都合でEquatableの比較時にオブジェクトの一意な情報も比較することで想定どおりの挙動になる。
また、Listでも再利用されるっぽいので同じように実装する必要あり。

公式の仕様については探し中

```diff
static func == (lhs: Self, rhs: Self) -> Bool {
return lhs.object.favorite == rhs.object.favorite
+             && lhs.object.id == rhs.object.id
     }
```


# 調査
様々なパターンで実装して確かめた。
![image.png](image.png)

# 環境
* 2.3 GHz 8-Core Intel Core i9
* MacOS Sonoma 14.0
* Version 15.0 (15A240d)

# 補足
* セルの量が多くないと再利用をするような挙動にならなったので、1000個ほどオブジェクトを用意している。そのためにこのプロジェクトのlaunchに時間がかかる。
* SwiftUIは書いたコードによって最適化の違いか思わぬところで挙動が変わってしまうので、このプロジェクトでも本質的な仕様を掴むことができていない。
例えば、HStackで要素を囲わないことで何故か挙動が正常になるみたいなこともあり困惑した。