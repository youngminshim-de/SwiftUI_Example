//
//  RandomUserRouter.swift
//  Practice_SwiftUI2
//
//  Created by 심영민 on 2022/03/08.
//

import Foundation
import Alamofire

//https://randomuser.me/api/?page=3&results=10&seed=abc
let BASE_URL = "https://randomuser.me/api/"

enum RandomUserRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .getUsers:
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        return request
    }
    
    case getUsers(page: Int = 1, results: Int = 20)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var endPoint: String {
        switch self {
        case .getUsers:
            return ""
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getUsers(let page, let results):
            return ["page": page,
                    "results": results,
                    "seed": "abc"]
        }
    }
}
