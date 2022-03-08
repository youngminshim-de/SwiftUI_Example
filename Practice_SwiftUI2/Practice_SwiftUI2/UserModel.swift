//
//  UserModel.swift
//  Practice_SwiftUI2
//
//  Created by 심영민 on 2022/03/08.
//

import Foundation

struct RandomUser: Decodable, CustomStringConvertible {
    let results: [UserInformation]
    let info: Information
    
    var description: String {
        return "results: \(results.count), info: \(info.seed)"
    }
}

struct UserInformation: Decodable, Identifiable {
    let id = UUID()
    let gender: String
    let name: Name
    let picture: Picture
    
    static func getDummy() -> Self {
        return UserInformation(gender: "male", name: Name.getDummy(), picture: Picture.getDummy())
    }
    
    var profileUrl: URL {
        get {
            URL(string: picture.medium)!
        }
    }
}

// User 간 비교를 위한 Equatable 프로토콜 채택
extension UserInformation: Equatable {
    static func == (lhs: UserInformation, rhs: UserInformation) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Information: Decodable, CustomStringConvertible {
    let seed: String
    let results: Int
    let page: Int
    let version: String
    
    var description: String {
        return "seed: \(seed) / version: \(version) / resultsCount: \(results) / page: \(page)"
    }
}

struct Name: Decodable, CustomStringConvertible {
    let title: String
    let first: String
    let last: String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func getDummy() -> Self {
        return Name(title: "심", first: "영", last: "민")
    }
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
    
    static func getDummy() -> Self {
        return Picture(large: "https://randomuser.me/api/portraits/women/58.jpg",
                       medium: "https://randomuser.me/api/portraits/women/58.jpg",
                       thumbnail: "https://randomuser.me/api/portraits/women/58.jpg")
    }
}


