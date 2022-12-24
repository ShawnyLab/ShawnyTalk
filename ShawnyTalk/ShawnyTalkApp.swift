//
//  ShawnyTalkApp.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/23.
//

import SwiftUI

@main
struct ShawnyTalkApp: App {
    let userModel = CurrentUserModel()
    
    var body: some Scene {
        WindowGroup {
            SigninView()
                .preferredColorScheme(.light)
                .environmentObject(CurrentUserModel.preview)
                .environmentObject(FriendService.preview)
        }
    }
}
