//
//  ChatService+Api.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/27.
//

import FirebaseFirestore

extension ChatService {
    
    @MainActor
    func fetch() async throws {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(CurrentUserModel.shared.uid).collection("chatRooms")
        
        do {
            let dataSnapshot = try await docRef.getDocuments()
            
            for document in dataSnapshot.documents {
                
                if let model = SimpleChatRoomModel(data: document.data(), uid: document.documentID) {
                    chatRoomList.append(model)
                }
            }
            
        } catch {
            throw ApiError.invalidResponse
        }
        
    }
    
    func enterChatRoom(id: String) async throws {
        let db = Firestore.firestore()
        let docRef = db.collection("chatRooms").document(id).collection("chats")
        var chats = [ChatModel]()
        
        do {
            let snapshot = try await docRef.getDocuments()
            
            for document in snapshot.documents {
                if let model = ChatModel(data: document.data(), key: document.documentID) {
                    chats.append(model)
                }
            }
            
            self.chats = chats
        } catch {
            throw ApiError.invalidResponse
        }
        
    }
    
    func createChatRoom() {
        
    }
    
}
