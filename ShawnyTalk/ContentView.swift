//
//  ContentView.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Color.main.ignoresSafeArea()
            Color.sub1.ignoresSafeArea()
                .frame(height: 60)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
