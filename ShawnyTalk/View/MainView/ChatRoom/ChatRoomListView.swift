//
//  ChatRoomListView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import SwiftUI

struct ChatRoomListView: View {
    @EnvironmentObject private var service: ChatService
    @EnvironmentObject private var currentUserModel: CurrentUserModel
    @EnvironmentObject private var friendService: FriendService
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(service.chatRoomList ?? []) { chatRoom in
                    SimpleChatRoom(model: chatRoom,
                                   friendModel: chatRoom.getOtherUsers(friendList: friendService.friendList ?? [], myUid: currentUserModel.uid).first!,
                                   myUid: currentUserModel.uid)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ChatRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChatRoomListView()
        }
        .environmentObject(ChatService.preview)
        .environmentObject(FriendService.preview)
        .environmentObject(CurrentUserModel.preview)

    }
}

struct GroupChatRoom: View {
    let model: ChatRoomModel
    
    var body: some View {
        HStack {
            
        }
    }
}

struct SimpleChatRoom: View {
    let model: ChatRoomModel
    let friendModel: FriendModel
    var myUid: String
    
    @State private var isPresented: Bool = false
     

    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            HStack {
                
                AsyncImage(url: URL(string: friendModel.profileUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .cornerRadius(13)

                } placeholder: {
                    
                }
                
                VStack(alignment: .leading) {
                    Text(friendModel.displayName)
                    
                    Text(model.chats.last!.message)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Text(model.chats.last!.createdAt.hourAndMinute)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 20)
        .foregroundColor(.black.opacity(0.8))
        .fullScreenCover(isPresented: $isPresented) {
            ChatView(friendModel: friendModel, chatRoomModel: model, isPresented: $isPresented)
        }
    }
}
