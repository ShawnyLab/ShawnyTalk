//
//  ShawnyTalkApp.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct ShawnyTalkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let userModel = CurrentUserModel.shared
    let friendService = FriendService()
    let chatService = ChatService()
    
    var body: some Scene {
        WindowGroup {
            SigninView()
                .preferredColorScheme(.light)
                .environmentObject(userModel)
                .environmentObject(friendService)
                .environmentObject(chatService)
        }
    }
}
