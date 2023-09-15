//
//  ContentView.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI


struct Object: Equatable {
    var id: String
    var favorite: Bool
    init(data: String, favorite: Bool) {
        self.id = data
        self.favorite = favorite
    }
}

func makeData () -> [Object] { (0...100).map { Object(data: String($0), favorite: false ) } }


struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top) {
                VStack {
                    Text("❌BadPattern1").frame(width: 150)
                    BadPattern1.ContentView()
                }
                
                VStack {
                    Text("✅GoodPattern1")
                    Text("BadPattern1の\nセルをHStackで囲わないようにする")
                    GoodPattern1.ContentView()
                }
                
                
                VStack {
                    Text("✅GoodPattern2")
                    Text("BadPattern1の\nEquatableの結果を全てfalseにする")
                    GoodPattern2.ContentView()
                }
                
                VStack {
                    Text("✅GoodPattern3")
                    Text("BadPattern1で\nEquatableに準拠しない。")
                    GoodPattern3.ContentView()
                }
                
                VStack {
                    Text("✅GoodPattern4")
                    Text("BadPattern1で\nonTapGestureを利用する")
                    GoodPattern4.ContentView()
                }
                
                VStack {
                    Text("✅GoodPattern5")
                    Text("BadPattern1で\nLazyVStackではなくVStackを使う")
                    GoodPattern5.ContentView()
                }
                
                VStack {
                    Text("✅GoodPattern6")
                    Text("BadPattern1で\nObjectからfavoriteを削除")
                    GoodPattern6.ContentView()
                }
                
                VStack {
                    Text("✅GoodPattern7")
                    Text("BadPattern1で\nEquatableの比較時にセルの一意な値も共に比較する")
                    GoodPattern7.ContentView()
                }
                
                VStack {
                    Text("✅GoodPattern7_2")
                    Text("GoodPattern7でセルの更新もしてみる")
                    GoodPattern7_2.ContentView()
                }
                
                VStack {
                    Text("❌BadPattern2").frame(width: 150)
                    Text("Listをつかう")
                    BadPattern2.ContentView()
                }
                VStack {
                    Text("✅GoodPattern8")
                    Text("BadPattern1で\nEquatableの比較時にセルの一意な値も共に比較する")
                    GoodPattern7.ContentView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
    }
}

#Preview {
    ContentView()
}
