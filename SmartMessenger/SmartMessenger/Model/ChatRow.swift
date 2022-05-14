//
//  ChatRow.swift
//  SmartMessenger
//
//  Created by sudohostname on 5/14/22.
//

import SwiftUI

struct ChatRow: View {
    
    let state: MessageState
    var isSender: Bool {
        return state == .messageSent
    }
    
    let text: String
    init(text: String, type: MessageState) {
        self.text = text
        self.state = type
    }
    
    
    var body: some View {
        
        HStack {
            
            if isSender {
                Spacer()
            }
            if !isSender {
                
                VStack {
                    
                    Spacer()
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .font(.system(size: 20))
                        .background(Circle().fill(Color.init(red: 0.84, green: 0.86, blue: 0.87)))
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                        .shadow(color: .white, radius: 3, x: -5, y: -5)
                        .foregroundColor(.white)
                    
                }
                .padding(.leading, 10)
            }
            
            
            HStack {
                HStack {
                    Text(text)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(isSender ? Color.black : Color(.label))
                        .padding()
                    }
                .background(isSender ? Color.init(red: 0.68, green: 0.71, blue: 0.75) : Color.init(red: 0.84, green: 0.86, blue: 0.87))
                .frame(height: 50)
                .font(Font.custom("Baloo Thambi 2", size: 18))

                .cornerRadius(20)
                .padding(isSender ? .leading : .trailing)
                .padding(.trailing, 10)
            }
            .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
            .shadow(color: .white, radius: 3, x: -5, y: -5)
            
            
            if !isSender {
                Spacer()
            }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(text: "Test", type: .messageReceived)
    }
}
