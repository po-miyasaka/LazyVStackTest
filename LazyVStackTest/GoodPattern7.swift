//
//  GoodPattern6.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI


enum GoodPattern7 {
    
    //////////////
    /// BadPattern1でEquatableの比較時にセルの一意な値も共に比較する
    /////////////
    
    struct ContentView: View {
        @State var dataArray: [Object] = makeData()
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(dataArray, id: \.id ) { object in
                        Row(object: object) { object in
                            print(object)
                            let index = dataArray.firstIndex(of: object)!
                            dataArray[index] = .init(data: object.id, favorite: !object.favorite)
                        }
                    }
                }
            }.frame(height: 400)
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
            let _ = print("body", object.id)
            HStack {
                Button(action: {
                    tap(object)
                }, label: {
                    Text(" \(object.id)")
                    Text(object.favorite ? "★" : "")
                })
            }
        }
    }
}


#Preview {
    GoodPattern6.ContentView()
}
