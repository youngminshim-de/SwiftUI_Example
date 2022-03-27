//
//  PickerView.swift
//  Practice_SwiftUI_Grid
//
//  Created by 심영민 on 2022/03/27.
//

import SwiftUI

struct PickerView: View {
    @State private var selectedValue = 0
    let myColorArray = ["레드", "그린", "블루"]
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Circle()
                .foregroundColor(changeColor(index: selectedValue))
                .frame(width: 50, height: 50)
                
                
            Text("세그먼트 value : \(selectedValue)")
            Text("선택된 색깔 : \(myColorArray[selectedValue])")
            Picker(selection: $selectedValue) {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            } label: {
                Text("피커")
            }
        .pickerStyle(.segmented)
            
            Picker(selection: $selectedValue) {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            } label: {
                Text("")
            }
            .pickerStyle(.inline)
            .frame(width: 100, height: 100)
            .clipped()
            .border(changeColor(index: selectedValue), width: 10)
        }
        .padding(.horizontal, 20)
    }
    func changeColor(index: Int) -> Color {
        switch index {
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.blue
        default :
            return Color.red
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
