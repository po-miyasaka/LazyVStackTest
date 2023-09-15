//
//  GoodPattern6.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI


enum GoodPattern6 {
    
    //////////////
    /// BadPattern1でObjectからfavoriteを削除
    /////////////
    ///
    ///
    struct Object6 {
        var data: String
        init(data: String) {
            self.data = data
        }
    }
    struct ContentView: View {
        @State var dataArray: [Object6] = (0...1000).map { Object6(data: String($0) ) }
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(dataArray, id: \.data ) { object in
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
            return lhs.object.data == rhs.object.data
        }
        
        let object: Object6
        var tap: (Object6) -> Void
        @ViewBuilder
        var body: some View {
            HStack {
                Button(action: {
                    tap(object)
                }, label: {
                    Text(" \(object.data)")
                })
            }
        }
    }
}

#Preview {
    GoodPattern6.ContentView()
}
