//
//  ProfileImageView.swift
//  Practice_SwiftUI2
//
//  Created by 심영민 on 2022/03/08.
//

import SwiftUI
import URLImage

struct ProfileImageView: View {
    var imageUrl: URL
    var body: some View {

        URLImage(imageUrl) { image in
            image
                .resizable()
                .scaledToFit()
        }
        .frame(width: 60, height: 60)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/58.jpg")!
        ProfileImageView(imageUrl: url)
    }
}
