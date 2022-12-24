//
//  CurrentUserModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import Foundation

final class CurrentUserModel: NSObject, ObservableObject {
    
    @Published var displayName: String
    @Published var registered: Bool
    @Published var profileImageUrl: String
    @Published var phoneNumber: String
    
    let isPreview: Bool
    
    init(preview: Bool = false) {
        displayName = ""
        registered = false
        profileImageUrl = ""
        phoneNumber = ""
                
        isPreview = preview
        super.init()
    }
    
    static var preview: CurrentUserModel {
        let model = CurrentUserModel(preview: true)
        model.displayName = "Shawn"
        model.registered = true
        model.profileImageUrl = "https://www.shutterstock.com/image-vector/abstract-vector-background-waves-3d-600w-569231599.jpg"
        model.phoneNumber = "01012341234"
        return model
    }
    
}
