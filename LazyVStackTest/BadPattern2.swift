//
//  BadPattern2.swift
//  LazyVStackTest
//
//  Created by po_miyasaka on 2023/09/15.
//

import SwiftUI


enum BadPattern2 {
    
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
            return true
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
    BadPattern2.ContentView()
}
