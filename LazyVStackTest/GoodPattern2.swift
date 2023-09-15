//
//  GoodPattern2.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI


enum GoodPattern2 {
    
    //////////////
    /// BadPattern1のEquatableの結果を全てfalseにする。
    /////////////
    
    struct ContentView: View {
        @State var dataArray: [Object] = makeData()
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(dataArray, id: \.id ) { object in
                        Row(object: object) { object in
                            print(object)
                        }
                    }
                }
            }.frame(height: 400)
        }
    }
    
    struct Row: View, Equatable {
        static func == (lhs: Self, rhs: Self) -> Bool {
            return false
        }
        
        let object: Object
        var tap: (Object) -> Void
        @ViewBuilder
        var body: some View {
            HStack {
                Button(action: {
                    tap(object)
                }, label: {
                    Text("Button \(object.id)")
                    Text("\(object.favorite ? "true" : "false")")
                })
            }
        }
    }
    
}

#Preview {
    GoodPattern2.ContentView()
}
