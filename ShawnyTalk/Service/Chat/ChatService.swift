//
//  ChatService.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/25.
//

import Foundation

class ChatService: NSObject, ObservableObject {
    
    @Published var chatRoomList: [ChatRoomModel]?
    
    let isPreview: Bool
    
    init(preview: Bool = false) {
        isPreview = preview
        
        super.init()
    }
    
    static var preview: ChatService {
        let service = ChatService(preview: true)
    
        service.chatRoomList = ChatRoomModel.preview
        
        return service
    }
}

