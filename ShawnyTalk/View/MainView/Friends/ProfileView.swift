//
//  ProfileView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/27.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isPresented: Bool
    var friendModel: FriendModel?

    var body: some View {
        ZStack {
            Color.sub2
                .ignoresSafeArea()
            if let friendModel = friendModel {
                FriendProfileView(friendModel: friendModel, isPresented: $isPresented)
            } else {
                MyProfileView(isPresented: $isPresented)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isPresented: .constant(false))
            .environmentObject(CurrentUserModel.preview)
            
    }
}

struct FriendProfileView: View {
    var friendModel: FriendModel
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            ProfileBackgroundView(backgroundUrl: friendModel.backgroundUrl, isPresented: $isPresented)
            
            VStack {
                Spacer()
                
                AsyncImage(url: URL(string: friendModel.profileUrl ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: 90, height: 90)
                        .cornerRadius(35)
                } placeholder: {
                    
                }
                
                Text(friendModel.displayName)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.bottom, 3)
                
                if let message = friendModel.message {
                    Text(message)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.bottom, 20)
                }
                
                Color.init(white: 0.6)
                    .frame(height: 1)
                
                ProfileButtonContainerView()
            }
        }
    }
}

struct MyProfileView: View {
    @EnvironmentObject private var currentUserModel: CurrentUserModel
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            ProfileBackgroundView(backgroundUrl: currentUserModel.backgroundUrl, isPresented: $isPresented)
            
            VStack {
                Spacer()
                
                AsyncImage(url: URL(string: currentUserModel.profileImageUrl)) { image in
                    image
                        .resizable()
                        .frame(width: 90, height: 90)
                        .cornerRadius(35)
                } placeholder: {
                    
                }
                
                Text(currentUserModel.displayName)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.bottom, 3)
                
                if let message = currentUserModel.message {
                    Text(message)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.bottom, 20)
                }
                
                Color.init(white: 0.6)
                    .frame(height: 1)
                
                ProfileButtonContainerView()
            }
        }
    }
}


struct ProfileBackgroundView: View {
    var backgroundUrl: String?
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "xmark")
                }
                .foregroundColor(.white)
                .padding()
                
                Spacer()
            }
            .frame(height: 60)

            Spacer()
        }
        .background {
            AsyncImage(url: URL(string: backgroundUrl ?? "")) { image in
                image.resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            } placeholder: {
                ProgressView()
            }
            
        }
    }
}

struct ProfileButtonContainerView: View {
    var body: some View {
        HStack {
            Button {
                print("chat")
            } label: {
                VStack {
                    Image(systemName: "message.fill")
                        .padding(.vertical, 8)
                    Text("1:1 채팅")
                        .font(.caption)
                }
            }
            .padding(.leading, 60)
            
            Spacer()
            
            Button {
                print("phone")
            } label: {
                VStack {
                    Image(systemName: "phone.fill")
                        .padding(.vertical, 8)
                    Text("통화하기")
                        .font(.caption)
                    
                }
            }
            
            Spacer()
            
            Button {
                print("chat")
            } label: {
                VStack {
                    Image(systemName: "video.fill")
                        .padding(.vertical, 8)
                    Text("페이스톡")
                        .font(.caption)
                    
                }
            }
            .padding(.trailing, 60)
            
        }
        .frame(height: 120)
        .foregroundColor(.white)
    }
}
