//
//  ContentView.swift
//  Practice_SwiftUI_State
//
//  Created by 심영민 on 2022/03/22.
//

import SwiftUI

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}

struct ContentView: View {
    @State private var isPlaying: Bool = false
    
    var body: some View {
//        Button(isPlaying ? "Pause" : "Play") {
//            isPlaying.toggle()
//            print(isPlaying)
//        }
        
        VStack {
            PlayButton(isPlaying: $isPlaying)
            Text("이병오 = BMO")
                .foregroundColor(.black)
                .isHidden(true)
            Text("심영민 = Min")
        }
        .onAppear {
            print(type(of: self.body))
        }
        
        VStack {
            PlayButton(isPlaying: $isPlaying)
            Text("이병오 = BMO")
                .foregroundColor(.black)
                .isHidden(true, true)
            Text("심영민 = Min")
        }
        .onAppear {
            print(type(of: self.body))
        }
        
        VStack {
            PlayButton(isPlaying: $isPlaying)
            Text("이병오 = BMO")
                .foregroundColor(.black)
                .isHidden(false)
            Text("심영민 = Min")
        }
        .onAppear {
            print(type(of: self.body))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    @ViewBuilder
    func isHidden(_ hidden: Bool, _ remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
