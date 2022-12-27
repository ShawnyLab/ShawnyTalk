//
//  CurrentUserModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import Foundation
import FirebaseFirestore

final class CurrentUserModel: NSObject, ObservableObject {
    static let shared = CurrentUserModel()
    
    var uid: String
    @Published var registered: Bool = true
    @Published var displayName: String
    @Published var message: String?
    @Published var profileImageUrl: String
    @Published var backgroundUrl: String?
    @Published var phoneNumber: String
    
    let isPreview: Bool
    var friends: [String: Bool] = [:]
    
    private init(preview: Bool = false) {
        uid = "myuid"
        displayName = ""
        registered = false
        profileImageUrl = ""
        phoneNumber = ""
        message = nil
                
        isPreview = preview
        super.init()
    }
    
    static var preview: CurrentUserModel {
        let model = CurrentUserModel(preview: true)
        model.displayName = "Shawn"
        model.registered = true
        model.profileImageUrl = "https://www.shutterstock.com/image-vector/abstract-vector-background-waves-3d-600w-569231599.jpg"
        model.phoneNumber = "01012341234"
        model.message = "iOS 개발자 shawn 입니다."
        model.backgroundUrl = "https://image.shutterstock.com/image-photo/wooden-house-winter-forest-260nw-166718984.jpg"
        return model
    }

    
}

extension CurrentUserModel {

    @MainActor
    func fetch(uid: String) async throws {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        
        do {
            let dataSnapshot = try await docRef.getDocument()
            guard let data = dataSnapshot.data() else {
                throw ApiError.emptyData
            }
            
            print(data)
            update(data: data, uid: uid)
            
        } catch {
            throw ApiError.invalidResponse
        }
    }
    
    private func update(data: [String: Any], uid: String) {
        guard let displayName = data["displayName"] as? String,
              let profileImageUrl = data["profileImageUrl"] as? String,
              let phoneNumber = data["phoneNumber"] as? String else {
            return
        }
        
        self.uid = uid
        self.displayName = displayName
        self.profileImageUrl = profileImageUrl
        self.phoneNumber = phoneNumber
        self.backgroundUrl = data["backgroundUrl"] as? String
        self.message = data["message"] as? String
        if let friends = data["friends"] as? [String: Bool] {
            self.friends = friends
        }
        
    }
    
}
