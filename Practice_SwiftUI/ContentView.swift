//
//  ContentView.swift
//  Practice_SwiftUI
//
//  Created by 심영민 on 2022/02/15.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    var body: some View {
        NavigationView {
            List {
                ForEach(carStore.cars) { car in
                    CarInformationCell(car: car)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
            .navigationTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewCar(carStore: carStore)) {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }

    }
    func moveItem(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
    // 각 Row(cell)가 삭제될 때 호출되는 함수이다.
    // 삭제 행동을 실행한 Row의 index가 전달되므로 IndexSet을 반드시 파라미터로 받아야 한다.
    func deleteItem(at offsets: IndexSet) {
        if let first = offsets.first {
            carStore.cars.remove(at: first)
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CarInformationCell: View {
    var car: Car
    var body: some View {
        NavigationLink(destination: CarDetail(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}
