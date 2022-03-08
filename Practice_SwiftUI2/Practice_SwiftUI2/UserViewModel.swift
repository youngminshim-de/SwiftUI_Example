//
//  UserViewModel.swift
//  Practice_SwiftUI2
//
//  Created by 심영민 on 2022/03/08.
//

import Foundation
import Combine
import Alamofire

class UserViewModel: ObservableObject {
        
    var subscription = Set<AnyCancellable>()
    @Published var randomUsers = [UserInformation]()
    
    @Published var pageInfo: Information? {
        didSet {
            print("\(pageInfo?.page)")
        }
    }
    
    @Published var isLoading: Bool = false
    
    var refreshActionSubject = PassthroughSubject<(), Never>()
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
        
    init() {
        fetchRandomUsers()
        
        refreshActionSubject
            .sink { [weak self] _ in
                guard let self = self else {
                    return
                }
                print("RandomUserViewModel - init - refreshActionSubject")
                self.fetchRandomUsers()
            }
            .store(in: &subscription)
        
        fetchMoreActionSubject
            .sink { [weak self] _ in
                guard let self = self else {
                    return
                }
                print("RandomUserViewModel - init - fetchMoreActionSubject")
                if !self.isLoading {
                    self.fetchMore()
                }
            }
            .store(in: &subscription)
    }
    
    fileprivate func fetchMore() {
        guard let currentPage = pageInfo?.page else {
            return
        }
        
        self.isLoading = true
        
        let pageToLoad = currentPage + 1
        AF.request(RandomUserRouter.getUsers(page: pageToLoad))
            .publishDecodable(type: RandomUser.self)
            .compactMap{ $0.value }
            .sink { completion in
                print("데이터스트림 완료")
            } receiveValue: { [weak self] receivedValue in
                guard let self = self else {
                    return
                }
                print("받은 값: \(receivedValue.results.count)")
                print("pageInfo: \(receivedValue.info.description)")
                self.randomUsers += receivedValue.results
                self.pageInfo = receivedValue.info
                self.isLoading = false
            }
            .store(in: &subscription)
    }
    
    fileprivate func fetchRandomUsers() {
        AF.request(RandomUserRouter.getUsers())
            .publishDecodable(type: RandomUser.self)
            .compactMap{ $0.value }
            .sink { completion in
                print("데이터스트림 완료")
            } receiveValue: { [weak self] receivedValue in
                guard let self = self else {
                    return
                }
                print("받은 값: \(receivedValue.results.count)")
                print("pageInfo: \(receivedValue.info.description)")
                self.randomUsers = receivedValue.results
                self.pageInfo = receivedValue.info
            }
            .store(in: &subscription)
    }
}
