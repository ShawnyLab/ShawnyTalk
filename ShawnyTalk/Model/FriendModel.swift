//
//  FriendModel.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import Foundation

struct FriendModel: Identifiable {
    var id = UUID()
    
    let uid: String
    let displayName: String
    let message: String?
    let profileUrl: String?
    let backgroundUrl: String?

    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id && lhs.uid == rhs.uid
    }

}

extension FriendModel {
    init?(data: [String: Any], key: String) {
        guard let displayName = data["displayName"] as? String else { return nil }

        self.uid = key
        self.displayName = displayName
        self.profileUrl = data["profileImageUrl"] as? String
        self.message = data["message"] as? String
        self.backgroundUrl = data["backgroundUrl"] as? String
    }
}

extension FriendModel {
    static let randomImages = ["https://image.shutterstock.com/image-vector/image-blue-flowers-paints-vector-260nw-706270855.jpg",
                               "https://www.shutterstock.com/image-vector/abstract-vector-background-waves-3d-600w-569231599.jpg",
                               "https://www.shutterstock.com/image-illustration/hand-painted-watercolor-botanical-tropical-600w-495854251.jpg",
                               "https://image.shutterstock.com/image-vector/abstract-watercolor-splash-drop-260nw-278970998.jpg",
                               "https://image.shutterstock.com/image-vector/yellow-ink-shiny-weather-sun-260nw-794419795.jpg",
                               "https://image.shutterstock.com/image-vector/vector-illustration-abstract-geometric-seamless-260nw-270950978.jpg",
                               "https://image.shutterstock.com/image-vector/vector-flowers-set-beautiful-wreath-260nw-423321838.jpg",
                               "https://image.shutterstock.com/image-vector/watercolor-vintage-flags-garlands-set-260nw-285573209.jpg",
                               "https://image.shutterstock.com/image-vector/collection-watercolor-flying-butterflies-260nw-258138359.jpg",
                               "https://image.shutterstock.com/image-vector/watercolor-set-seashells-on-white-260nw-272568710.jpg",
                               "https://image.shutterstock.com/image-vector/abstract-art-background-watercolor-stain-260nw-1742115467.jpg"
                               
    ]
    
    static var preview: [FriendModel] {
        return (1..<4).map {
            return FriendModel(uid: "friend\($0)",
                               displayName: "friend\($0)",
                               message: "저는 shawn의 \($0)번째 친구에요.",
                               profileUrl: FriendModel.randomImages[$0],
                               backgroundUrl: nil)
        }
    }
}
