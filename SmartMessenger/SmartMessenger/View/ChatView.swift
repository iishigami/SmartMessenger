//
//  ChatView.swift
//  SmartMessenger
//
//  Created by sudohostname on 5/14/22.
//

import SwiftUI

struct CustomField : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(4)
    }
}
struct ChatView: View {
    
    @State var message: String = ""
    @EnvironmentObject var model: AppStateModel
    
    let otherUserName: String
    init(otherUserName: String) {
        self.otherUserName = otherUserName
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.white, (Color.init(red: 0.84, green: 0.86, blue: 0.87))]),
              startPoint: UnitPoint(x: 0.2, y: 0.2),
              endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            VStack {
                ScrollView(.vertical) {
                    ForEach(model.messages, id: \.self) { message in
                        ChatRow(text: message.messageText, type: message.messageState)
                            .padding(5)
                    }
                }
                HStack {
                    TextField("Message", text: $message)
                        .padding()
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.95, green: 0.95, blue: 0.96)))
                        .scaledToFill()
                        .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                        .shadow(color: .white, radius: 3, x: -5, y: -5)
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                    SendButton(text: $message)
                }
                .padding()
            }
            .navigationBarTitle(otherUserName, displayMode: .inline)
            .accentColor(.black)
            .onAppear {
                model.otherUsername = otherUserName
                model.observeChat()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(otherUserName: "User")
    }
}
