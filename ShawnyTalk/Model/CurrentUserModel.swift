//
//  CurrentUserModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import Foundation

final class CurrentUserModel: NSObject, ObservableObject {
    
    let uid: String
    @Published var registered: Bool
    @Published var displayName: String
    @Published var message: String?
    @Published var profileImageUrl: String
    @Published var phoneNumber: String
    
    let isPreview: Bool
    
    init(preview: Bool = false) {
        uid = "me"
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
        return model
    }
    
}
