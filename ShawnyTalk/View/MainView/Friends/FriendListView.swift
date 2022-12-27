//
//  FriendListView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import SwiftUI

struct FriendListView: View {
    @EnvironmentObject private var service: FriendService
    
    var body: some View {
        ScrollView {
            VStack {
                MyView()
                
                Color.gray
                    .frame(height: 1)
                
                HStack {
                    Text("친구 \(service.friendList.count)")
                        .font(.caption)
                        .padding(.top, 10)
                        
                    Spacer()
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            }

            ForEach(service.friendList) { friendModel in
                FriendView(imageUrl: friendModel.profileUrl ?? "",
                           displayName: friendModel.displayName,
                           message: friendModel.message ?? "")
            }
        }
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FriendListView()
        }
        .environmentObject(CurrentUserModel.preview)
        .environmentObject(FriendService.preview)
    }
}

struct MyView: View {
    @EnvironmentObject private var currentUserModel: CurrentUserModel

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: currentUserModel.profileImageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(13)
                

            } placeholder: {

            }

            VStack(alignment: .leading) {
                Text(currentUserModel.displayName)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.8))
                
                Text(currentUserModel.message ?? "")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    
            }
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
    var message: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .cornerRadius(13)

            } placeholder: {
                
            }

            VStack(alignment: .leading) {
                Text(displayName)
                    .foregroundColor(.black.opacity(0.8))
                
                Text(message)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(5)

            
            Spacer()
            
        }
        .frame(height: 60)
        .padding(.horizontal, 20)
    }
}
