//
//  FriendService.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import Foundation

class FriendService: NSObject, ObservableObject {
    
    @Published var friendList: [FriendModel] = []
    @Published var updating: Bool
    
    let isPreview: Bool
    
    init(preview: Bool = false) {
        isPreview = preview
        updating = false
        
        super.init()
    }
    
    static var preview: FriendService {
        let service = FriendService(preview: true)
    
        service.friendList = FriendModel.preview
        
        return service
    }
}
