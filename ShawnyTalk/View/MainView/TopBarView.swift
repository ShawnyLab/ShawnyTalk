//
//  TopBarView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import SwiftUI

struct TopBarView: View {
    private let titles = ["친구", "채팅", "쇼핑", "더보기"]
    @Binding var selection: Int
    
    var body: some View {
        HStack {
            Text(titles[selection])
                .fontWeight(.black)
                .font(.title)
                .foregroundColor(.sub3)
            
            Spacer()
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .padding(8)
                
                Button {
                    
                } label: {
                    Image(systemName: "person.badge.plus")
                }
                .padding(8)
                
                Button {
                    
                } label: {
                    Image(systemName: "music.note")
                }
                .padding(8)
                
                Button {
                    
                } label: {
                    Image(systemName: "gearshape")
                }
                .padding(8)

            }
            .foregroundColor(.sub3)
                
        }
        .padding()
    }
}
