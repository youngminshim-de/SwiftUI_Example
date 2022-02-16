//
//  Car.swift
//  Practice_SwiftUI
//
//  Created by 심영민 on 2022/02/16.
//

import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}
