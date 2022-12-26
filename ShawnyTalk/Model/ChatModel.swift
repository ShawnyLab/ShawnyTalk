//
//  ChatModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/25.
//

import Foundation

struct ChatModel: Identifiable {
    let id = UUID()
    
    let writerId: String
    let message: String
    let imageUrl: String?
    let createdAt: Date
}

extension ChatModel {
    
    static var preview: [ChatModel] {
        return (0..<30).map {
            return ChatModel(writerId: "me",
                             message: "hihi \($0)",
                             imageUrl: nil,
                             createdAt: .now)
        }
    }
    
}
