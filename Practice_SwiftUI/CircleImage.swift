//
//  CircleImage.swift
//  Practice_SwiftUI
//
//  Created by 심영민 on 2022/02/15.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ExampleImage")
            .clipShape(Capsule())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
