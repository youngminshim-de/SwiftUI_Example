//
//  CarDetail.swift
//  Practice_SwiftUI
//
//  Created by 심영민 on 2022/02/16.
//

import SwiftUI

struct CarDetail: View {
    let selectedCar: Car
    var body: some View {
        Form {
             
            Section(content: {
                Image(selectedCar.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12.0)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }

            }, header: {
                Text("Car Details")
            })
            
        }
    }
}

struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        CarDetail(selectedCar: carData[0])
    }
}
