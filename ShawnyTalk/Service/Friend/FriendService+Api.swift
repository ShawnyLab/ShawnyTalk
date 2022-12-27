//
//  FriendService+Api.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/26.
//

import Firebase

extension FriendService {
    
    @MainActor
    func fetchFriends(_ ids: [String]) async {
                
        do {
            for id in ids {
                let friend = try await fetchUser(id: id)
                if let friend { friendList.append(friend) }
            }
        } catch {
            print("fetch friend error")
        }

    }
    
    private func fetchUser(id: String) async throws -> FriendModel? {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(id)
        var friend: FriendModel?

        do {
            let documentSnapShot = try await docRef.getDocument()
            
            guard let data = documentSnapShot.data() else {
                throw ApiError.emptyData
            }
            
            friend = FriendModel(data: data, key: id)
            
        } catch {
            throw ApiError.invalidResponse
        }

        return friend
    }
}

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}

