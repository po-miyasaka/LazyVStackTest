//
//  GoodPattern6.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI


enum GoodPattern8 {
    
    //////////////
    /// BadPattern2でEquatableの比較時にセルの一意な値も共に比較する
    /////////////
    
    struct ContentView: View {
        @State var dataArray: [Object] = makeData()
        var body: some View {
            List(dataArray, id: \.id){ object in
                Row(object: object) { object in
                    print(object)
                }
            }
        }
    }
    
    struct Row: View, Equatable {
        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.object.favorite == rhs.object.favorite
            && lhs.object.id == rhs.object.id
        }
        
        let object: Object
        var tap: (Object) -> Void
        @ViewBuilder
        var body: some View {
            HStack {
                Button(action: {
                    tap(object)
                }, label: {
                    Text(" \(object.id)")
                })
            }
        }
    }
}

#Preview {
    GoodPattern6.ContentView()
}
