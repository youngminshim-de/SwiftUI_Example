//
//  ContentView.swift
//  Practice_SwiftUI2
//
//  Created by 심영민 on 2022/03/08.
//

import SwiftUI
import URLImage
import Introspect

// RefreshControl에 Action을 지정해주기 위해서는 @objc 함수를 사용해야 한다.
// 하지만 SwiftUI는 지원을 하지 않기에 CustomClass를 따로 만들어 주어야 한다.
// RefreshControl 또한 SwiftUI에서는 지원하지 않는다. 결국 introspect 라이브러리를 이용해
// UIKit을 사용하는 방식이다.
class RefreshControlHelper {
    
    var parentContentView: ContentView?
    var refreshControl: UIRefreshControl?
    
    @objc func didRefresh() {
        guard let parentContentView = parentContentView,
              let refreshControl = refreshControl else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            parentContentView.randomUserViewModel.refreshActionSubject.send()
            refreshControl.endRefreshing()
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = UserViewModel()
    
    let refreshControlHelper = RefreshControlHelper()
    
    var body: some View {
        List(randomUserViewModel.randomUsers) { randomUser in
            RandomUserView(randomUser)
                .onAppear {
                    print("RandomUserView - onAppear() called")
                    fetchRandomUser(randomUser)
                }
        }
        .introspectTableView { self.configureRefreshControl($0) }
        
        if randomUserViewModel.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.orange))
                .scaleEffect(1.7, anchor: .center)
        }
    }
}
//MARK: - Helper Methods
extension ContentView {
    fileprivate func configureRefreshControl(_ tableView: UITableView) {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .orange
        refreshControlHelper.refreshControl = refreshControl
        refreshControlHelper.parentContentView = self
        refreshControl.addTarget(refreshControlHelper,
                                 action: #selector(refreshControlHelper.didRefresh),
                                 for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    fileprivate func fetchRandomUser(_ randomUser: UserInformation) {
        if self.randomUserViewModel.randomUsers.last == randomUser {
            print("마지막이다.")
            randomUserViewModel.fetchMoreActionSubject.send()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
