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
    @State var chatRoomModel: ChatRoomModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            ChatViewTopBar(friendModel: friendModel, isPresented: $isPresented)
            
            Spacer()
            
            ScrollView {
                ForEach(chatRoomModel.chats) { chatModel in
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
                        Text("your word")
                    }
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    
    static var previews: some View {
        ChatView(friendModel: .preview.first!, chatRoomModel: .preview.first!, isPresented: .constant(true))
            .environmentObject(CurrentUserModel.preview)
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
