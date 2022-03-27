//
//  SegmentLayoutView.swift
//  Practice_SwiftUI_Grid
//
//  Created by 심영민 on 2022/03/27.
//

import SwiftUI

enum LayoutType: CaseIterable {
    case table, grid, multiple
}

extension LayoutType {
    // 레이아웃 타입에 대한 컬럼이 자동으로 설정되도록 한다.
    var columns : [GridItem] {
        switch self {
        case .table:
            return [
                // flexible 하나로 한줄로 표현
                GridItem(.flexible())
            ]
        case .grid:
            return [
                // flexible 두개를 넣어서 두개 아이템 표현
                GridItem(.flexible()),
                    GridItem(.flexible())
            ]
        case .multiple:
            return [
                // adaptive로 minimum size만 넘는다면 되도록 많은 아이템 표현
                GridItem(.adaptive(minimum: 100))
            ]
        }
    }
}

struct SegmentLayoutView: View {
    @State private var selectedLayoutType: LayoutType = .table
    var dummyDataArray = MyModel.dummyDataArray
    var body: some View {
        VStack {
            Picker(selection: $selectedLayoutType) {
                ForEach(LayoutType.allCases, id: \.self) { type in
                    switch type {
                    case .table:
                        Image(systemName: "list.dash")
                        
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                        
                    case .multiple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                }
            } label: {
                Text("레이아웃 타입")
            }
            .frame(width: 250)
            .pickerStyle(.segmented)
            
            // column은 horizontal item layout을 설정하는 부분
            // GridItem.size option 3개
            // .fixed : 고정
            // .adaptive : 여러개 채우기 - 계산해서 분할로 채우기
            // .flexible : 하나만 채우기 - 계산해서 분할로 채우기
            ScrollView {
                LazyVGrid(columns: selectedLayoutType.columns) {
                    ForEach(dummyDataArray) { item in
                        
                        switch selectedLayoutType {
                        case .table:
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(height:100)
                        case .grid:
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(Color.pink)
                                .frame(height: 200)
                                .overlay {
                                    VStack {
                                        Circle()
                                            .frame(height: 100)
                                            .foregroundColor(.yellow)
                                        Spacer()
                                            .frame(height:10)
                                        
                                        Text(item.title)
                                        Text(item.content)
                                    }
                                }
                        case .multiple:
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(height:100)
                        }

                    }
                }
                .animation(.easeInOut)
                .padding(.horizontal, 10)
            }
        }
    }
}

struct SegmentLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
