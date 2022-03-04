//
//  StackView.swift
//  Practice_SwiftUI
//
//  Created by 심영민 on 2022/03/04.
//

import SwiftUI

struct StackView: View {
    @State private var isGreenAppear: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(height: 1000)
                    
                    Rectangle()
                        .foregroundColor(.blue)
                    
                        .frame(height: 700)
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(height: 400)
                        .onAppear {
                            isGreenAppear = true
                        }
                }
            }
            
            Text("Green is drawn")
                .background(Color.white)
                .opacity(isGreenAppear ? 1 : 0)
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
