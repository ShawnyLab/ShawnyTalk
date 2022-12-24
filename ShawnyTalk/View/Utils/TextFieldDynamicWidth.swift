//
//  TextFieldDynamicWidth.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/24.
//

import SwiftUI

struct TextFieldDynamicWidth: View {
    let title: String
    @Binding var text: String
    let onEditingChanged: (Bool) -> Void
    let onCommit: () -> Void
    
    @State private var textRect = CGRect()
    
    var body: some View {
        ZStack {
            Text(text == "" ? title : text).background(GlobalGeometryGetter(rect: $textRect)).layoutPriority(1).opacity(0)
            HStack {
                TextField(title, text: $text, onEditingChanged: onEditingChanged, onCommit: onCommit)
                .frame(width: textRect.width)
            }
        }
    }
}
