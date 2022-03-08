//
//  ProgressView.swift
//  Practice_SwiftUI
//
//  Created by 심영민 on 2022/03/04.
//

import SwiftUI

struct ProgressViewTest: View {
    @State private var progress = 0.5
    @State private var sampleHTML = """
안녕한라봉&#43;라이언<strong>안녕</strong>한라봉&#43;라이언<b>안녕</b><b>안녕</b>한라봉&#43;라이언<b>안녕</b><b>안녕</b>한라봉&#43;라이언<b>안녕</b><b>안녕</b>한라봉&#43;라이언<b>안녕</b><b>안녕</b>한라봉&#43;라이언<b>안녕</b><b>안녕</b>한라봉&#43;라이언<b>안녕</b><b>안녕</b>한라봉&#43;라이언<b>안녕</b><b>안녕</b>한라봉&#43;라이언<b>안녕</b>
"""
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("업체 상세평가")
                Text("4.42")
            }
            .font(.system(size: 17, weight: .bold))
            
            HStack {
                Text("수리 퀄리티")
                Spacer(minLength: 100)
                Image("ico_grade_16_filled")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 17, height: 17)
                    
                ProgressView(value: progress)
                Spacer()
                Text("4.61")
            }
            Text("나나나 <b>나나나</b>")
            
        }
        .padding()
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewTest()
    }
}
