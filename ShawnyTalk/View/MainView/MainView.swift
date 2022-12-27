//
//  MainView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 0

    
    var body: some View {
        VStack {
            TopBarView(selection: $selection)
            
            TabView(selection: $selection) {
                FriendListView()
                    .tabItem {
                        Image(systemName: "person.fill")
                    }
                    .tag(0)
                
                ChatRoomListView()
                    .badge(10)
                    .tabItem {
                        Image(systemName: "message")
                    }
                    .tag(1)
                
                ShoppingView()
                    .tabItem {
                        Image(systemName: "bag")
                    }
                    .tag(2)
                
                MoreView()
                    .tabItem {
                        Image(systemName: "ellipsis")
                    }
                    .tag(3)
            }
            .accentColor(.sub3)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CurrentUserModel.preview)
            .environmentObject(FriendService.preview)
            .environmentObject(ChatService.preview)

    }
}
