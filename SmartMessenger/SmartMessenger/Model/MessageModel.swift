//
//  MessageModel.swift
//  SmartMessenger
//
//  Created by sudohostname on 5/14/22.
//

import Firebase
import Foundation

enum MessageState: String {
    case messageSent
    case messageReceived
}


struct Message: Hashable {
    let messageText: String
    let messageState: MessageState
    let messageCreationDate: Date
}
