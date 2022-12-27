//
//  ChatModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/25.
//

import Foundation

struct ChatModel: Identifiable {
    let id = UUID()
    
    let uid: String
    let writerId: String
    let message: String
    let imageUrl: String?
    let createdAt: String
}

extension ChatModel {
    
    static var preview: [ChatModel] {
        return (0..<30).map {
            return ChatModel(uid: "dd",
                             writerId: $0 % 2 != 0 ? "myuid" : "friend1",
                             message: "hihi \($0)",
                             imageUrl: nil,
                             createdAt: "date")
        }
    }
    
    init?(data: [String: Any], key: String) {
        guard let writerId = data["writerId"] as? String,
              let message = data["message"] as? String,
              let createdAt = data["createdAt"] as? String
        else {
            return nil
        }
        
        self.uid = key
        self.writerId = writerId
        self.message = message
        self.createdAt = createdAt
        
        self.imageUrl = data["imageUrl"] as? String
    }
    
}
