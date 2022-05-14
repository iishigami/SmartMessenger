//
//  SendButton.swift
//  SmartMessenger
//
//  Created by sudohostname on 5/14/22.
//

import SwiftUI

struct CustomButton : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct SendButton: View {
    
    @Binding var text: String
    @EnvironmentObject var model: AppStateModel
    
    
    var body: some View {
        Button(action: {
            self.sendMessage()
        }, label: {
            Image(systemName: "paperplane")
                .resizable()
                .scaledToFit()
                .padding()
                .font(.system(size: 20))
                .background(Circle().fill(Color.init(red: 0.84, green: 0.86, blue: 0.87)))
                .frame(width: 50, height: 50)
                .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                .shadow(color: .white, radius: 3, x: -5, y: -5)
                .foregroundColor(.white)
        })
    }
    func sendMessage() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        model.sendMessage(text: text)
        text = ""
    }
}
