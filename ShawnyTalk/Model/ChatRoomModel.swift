//
//  ChatRoomModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/25.
//

import SwiftUI

struct ChatRoomModel: Identifiable {
    
    let id = UUID()
    
    let uid: String
    let users: [String]
    let chats: [ChatModel]
    var isFixed: Bool
    
}

extension ChatRoomModel {
    static var preview: [ChatRoomModel] {
        return (0..<10).map {
            return ChatRoomModel(uid: "\($0)", users: ["me", "friend\($0)"], chats: ChatModel.preview, isFixed: false)
        }
    }
    
    func getOtherUsers(friendList: [FriendModel], myUid: String) -> [FriendModel] {
        var myFriends = users
        if users.isEmpty { return [] }
    
        myFriends.removeAll(where: { $0 == myUid })
        return myFriends.map { friendId in
            return friendList
                .first { model in
                    model.uid == friendId
                }!
        }
    }
}