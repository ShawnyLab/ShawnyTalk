//
//  ChatService+Api.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/27.
//

import FirebaseFirestore

extension ChatService {
    
    func fetch() async {
        
    }
    
    func enterChatRoom(with friendId: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(friendId)
    }
    
    func createChatRoom() {
        
    }
    
}
