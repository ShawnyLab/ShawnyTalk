//
//  SigninView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/23.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject private var currentUserModel: CurrentUserModel
    @EnvironmentObject private var friendService: FriendService
    @FocusState private var isEditing
    @State private var showMainView = false
        
    var body: some View {
        VStack {
            GeometryReader { reader in
                Color.sub2.ignoresSafeArea()
                    .frame(height: reader.size.height+10)

                ZStack {
                    if friendService.updating {
                        ProgressView()
                    }
                    VStack {
                        Image(systemName: "message.fill")
                            .font(.largeTitle)
                            .padding()
                        
                        Text("Shawny Talk")
                            .fontWeight(.bold)
                        
                        ZStack {
                            Color.main
                            TextField("전화번호를 입력하세요", text: $currentUserModel.phoneNumber)
                                .padding(.horizontal)
                                .focused($isEditing)
                        }
                        .frame(height: 50)
                        .frame(minWidth: 200)
                        .border(Color.sub2, width: 2)
                        .cornerRadius(13)
                        .padding(50)
                        
                    }
                }
                .frame(height: reader.size.height)
            }
            
            ZStack {
                Color.sub1
                    .ignoresSafeArea()
                Button("로그인") {
                    friendService.updating = true
                    Task {
                        try await currentUserModel.fetch(uid: "myuid")
                        await friendService.fetchFriends()

                        showMainView.toggle()
                    }
                }
                .fullScreenCover(isPresented: $showMainView) {
                    MainView()
                }
                .foregroundColor(.sub3)
            }
            .frame(height: 60)
        }
        

    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
            .environmentObject(CurrentUserModel.preview)
            .environmentObject(FriendService.preview)
    }
}


