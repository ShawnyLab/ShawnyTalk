//
//  ChatView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject private var currentUserModel: CurrentUserModel
    @State var friendModel: FriendModel
    @Binding var chats: [ChatModel]
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            ChatViewTopBar(friendModel: friendModel, isPresented: $isPresented)
            
            Spacer()
            
            ScrollView {
                ForEach(chats) { chatModel in
                    if chatModel.writerId == currentUserModel.uid {
                        HStack {
                            Spacer()
                            
                            ZStack {
                                Text(chatModel.message)
                                    .padding(10)
                                    .foregroundColor(.sub3)

                            }
                            .background(Color.main)
                            .cornerRadius(13)
                            .padding(.horizontal, 8)
                        }
                    } else {
                        HStack {
                            ZStack {
                                Text(chatModel.message)
                                    .padding(10)
                                    .foregroundColor(.sub3)

                            }
                            .background(Color.main)
                            .cornerRadius(13)
                            .padding(.horizontal, 8)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    
    static var previews: some View {
        ChatView(friendModel: FriendModel.preview[0], chats: .constant(ChatService.preview.chats), isPresented: .constant(true))
            .environmentObject(CurrentUserModel.preview)
            .environmentObject(ChatService.preview)
    }
}

struct ChatViewTopBar: View {
    var friendModel: FriendModel
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    isPresented.toggle()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            
                        Text("115")
                    }
                }
                .padding(.horizontal, 5)
                
                Spacer()
                
                Button {
                    print("search")
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .padding(.horizontal, 5)

                
                Button {
                    print("line.3")
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
                .padding(.horizontal, 10)



            }
            .frame(height: 60)
            
            Text(friendModel.displayName)
        }
        .foregroundColor(.sub3)
    }
}
