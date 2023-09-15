//
//  GoodPattern1.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI


enum GoodPattern1 {
    //////////////
    /// BadPattern1のセルをHStackで囲わないようにする
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
            return lhs.object.favorite == rhs.object.favorite
        }
        
        let object: Object
        var tap: (Object) -> Void
        @ViewBuilder
        var body: some View {
            //        HStack {
            Button(action: {
                tap(object)
            }, label: {
                Text(" \(object.id)")

            })
            //        }
        }
    }
}

#Preview {
    GoodPattern1.ContentView()
}
