//
//  RandomUserView.swift
//  Practice_SwiftUI2
//
//  Created by 심영민 on 2022/03/08.
//

import SwiftUI

struct RandomUserView: View {
    
    var randomUser: UserInformation
    
    init(_ randomUser: UserInformation) {
        self.randomUser = randomUser
    }
    
    var body: some View {
        HStack {
            ProfileImageView(imageUrl: randomUser.profileUrl)
            Text(randomUser.name.description)
                .font(.system(size: 25, weight: .heavy))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
        .padding(.vertical)
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView(UserInformation.getDummy())
    }
}
