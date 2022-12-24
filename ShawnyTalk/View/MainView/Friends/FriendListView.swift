//
//  FriendListView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import SwiftUI

struct FriendListView: View {
    @EnvironmentObject private var currentUserModel: CurrentUserModel
    @EnvironmentObject private var service: FriendService
    
    var body: some View {
        ScrollView {
            VStack {
                MyView(imageUrl: $currentUserModel.profileImageUrl,
                       displayName: $currentUserModel.displayName)
                
                Color.gray
                    .frame(height: 1)
                
                HStack {
                    Text("친구 \(service.friendList?.count ?? 0)")
                        .font(.caption)
                        .padding(.top, 10)
                        
                    Spacer()
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            }

            ForEach(service.friendList ?? []) { friendModel in
                FriendView(imageUrl: friendModel.profileUrl,
                           displayName: friendModel.displayName)
            }
        }
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
            .environmentObject(CurrentUserModel.preview)
            .environmentObject(FriendService.preview)
    }
}

struct MyView: View {
    @Binding var imageUrl: String
    @Binding var displayName: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .border(Color.gray, width: 1)
                    .cornerRadius(13)

            } placeholder: {

            }

            Text(displayName)
                .fontWeight(.semibold)
                .padding(5)
            
            Spacer()
            
        }
        .frame(height: 60)
        .padding(.horizontal, 20)
    }
}

struct FriendView: View {
    var imageUrl: String
    var displayName: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .border(Color.gray, width: 1)
                    .cornerRadius(13)

            } placeholder: {
                
            }

            Text(displayName)
                .fontWeight(.semibold)
                .padding(5)
            
            Spacer()
            
        }
        .frame(height: 60)
        .padding(.horizontal, 20)
    }
}
