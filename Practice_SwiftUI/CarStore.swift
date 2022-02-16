//
//  CarStore.swift
//  Practice_SwiftUI
//
//  Created by 심영민 on 2022/02/16.
//

import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
