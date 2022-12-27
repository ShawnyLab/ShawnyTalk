//
//  ChatRoomModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/25.
//

import SwiftUI
import FirebaseCore

struct ChatRoomModel: Identifiable {
    
    let id = UUID()
    
    let uid: String
    let users: [String]
    let chats: [ChatModel]
    var isFixed: Bool
    var type: RoomType = .simple
}

extension ChatRoomModel {
    static var preview: [ChatRoomModel] {
        return (1..<4).map {
            return ChatRoomModel(uid: "\($0)", users: ["myuid", "friend\($0)"], chats: ChatModel.preview, isFixed: false)
        }
    }
}

struct SimpleChatRoomModel: Identifiable {
    let id = UUID()
    
    let uid: String
    let users: [String]
    let type: RoomType
    var lastMessage: LastMessageModel
    
    struct LastMessageModel {
        var message: String
        var createdAt: String
    }
    
    static var preview: [SimpleChatRoomModel] {
        let model = SimpleChatRoomModel(uid: "test",
                                        users: ["friend1"],
                                        type: .simple,
                                        lastMessage: LastMessageModel(message: "hihi", createdAt: "hihi"))
        
        return [model]
    }
}

extension SimpleChatRoomModel {
    
    init?(data: [String: Any], uid: String) {
        guard let users = data["users"] as? [String],
              let type = data["type"] as? String,
              let lastMessage = data["lastMessage"] as? [String: Any] else {
            return nil
        }
        self.users = users
        self.type = RoomType(rawValue: type) ?? .simple
        self.uid = uid
        
        self.lastMessage = LastMessageModel(message: lastMessage["message"] as! String, createdAt: lastMessage["createdAt"] as! String)
        
    }
    
    func getFriend(friendList: [FriendModel]) -> FriendModel {
        return friendList.first(where: { $0.uid == users.first! })!
    }
}

enum RoomType: String {
    case simple
    case group
}
