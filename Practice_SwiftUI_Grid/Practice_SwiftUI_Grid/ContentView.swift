//
//  ContentView.swift
//  Practice_SwiftUI_Grid
//
//  Created by 심영민 on 2022/03/27.
//

import SwiftUI

struct MyModel: Identifiable {
    let id = UUID()
    let title: String
    let content: String
}

extension MyModel {
    static var dummyDataArray: [MyModel] {
        (1...2000).map { num in
            MyModel(title: "타이틀: \(num)",
                    content: "content: \(num)")
        }
    }
}

struct ContentView: View {
    
    var dummyDataArray = MyModel.dummyDataArray
    
    var body: some View {
        ScrollView {

            
            LazyVGrid(columns: [GridItem(.fixed(100))], spacing: 20) {
                ForEach(dummyDataArray) { myModel in
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(minHeight: 120)
                        .overlay {
                            Text("\(myModel.title)")
                        }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
