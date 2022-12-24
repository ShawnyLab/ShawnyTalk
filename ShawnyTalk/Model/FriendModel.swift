//
//  FriendModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import Foundation

struct FriendModel: Identifiable {    
    let id = UUID()
    let profileUrl: String
    let displayName: String
}

extension FriendModel {
    static var preview: FriendModel {
        return FriendModel(profileUrl: "https://www.shutterstock.com/image-vector/abstract-vector-background-waves-3d-600w-569231599.jpg", displayName: "hihi")
    }
}
