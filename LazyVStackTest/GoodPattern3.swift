//
//  GoodPattern3.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI

enum GoodPattern3 {
    
    //////////////
    /// BadPattern1でEquatableに準拠しない。
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
    
    struct Row: View {
        
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
    GoodPattern3.ContentView()
}
