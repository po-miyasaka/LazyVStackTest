//
//  GoodPattern4.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI

enum GoodPattern4 {
    
    //////////////
    /// BadPattern1でonTapGestureを利用
    /////////////
    
    struct ContentView: View {
        @State var dataArray: [Object] = makeData()
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(dataArray, id: \.id ) { object in
                        Row(object: object) { object in
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
        }
        
        let object: Object
        var tap: (Object) -> Void
        @ViewBuilder
        var body: some View {
            let _ = print(object.id)
            HStack {
                //                Button(action: {
                //                    tap(object)
                //                }, label: {
                Text("\(object.id)")
                Text(object.favorite ? "true" : "false")
                //                })
            }
            .onTapGesture {
                print(object)
                tap(object)
            }
        }
    }
}
#Preview {
    GoodPattern4.ContentView()
}
