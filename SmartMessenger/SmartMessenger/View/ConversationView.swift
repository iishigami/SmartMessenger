//
//  ConversationView.swift
//  SmartMessenger
//
//  Created by sudohostname on 5/14/22.
//

import SwiftUI

struct ConversationListView: View {
    
    @EnvironmentObject var model: AppStateModel
    
    @State var otherUserName: String = ""
    @State var showChat = false
    @State var showSearch = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, (Color.init(red: 0.84, green: 0.86, blue: 0.87))]),
                  startPoint: UnitPoint(x: 0.2, y: 0.2),
                  endPoint: .bottomTrailing
                ).ignoresSafeArea()
                
                
                VStack {
                    
                    Text("Chats")
                        .font(Font.custom("Baloo Thambi 2", size: 23))
                        .padding(.bottom, 20)
                    
                    ScrollView(.vertical) {
                        ForEach(model.conversations, id: \.self) { name in
                            NavigationLink(
                                destination: ChatView(otherUserName: name),
                                label: {
                                    HStack {
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
                                        
                                        Text(name)
                                            .foregroundColor(Color(.label))
                                            .padding()
                                            .font(Font.custom("Baloo Thambi 2", size: 18))
                                        Spacer()
                                    }
                                    .frame(width: 330, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.95, green: 0.95, blue: 0.96)))
                                    .scaledToFill()
                                    .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                                    .shadow(color: .white, radius: 3, x: -5, y: -5)
                                }).padding()
                        }
                        if !otherUserName.isEmpty {
                            NavigationLink("",
                                           destination: ChatView(otherUserName: otherUserName),
                                           isActive: $showChat)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            Button("Sign Out") {
                                self.SignOut()
                            }
                        }
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            NavigationLink(
                                destination: SearchView { name in
                                    self.showSearch = false
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                                        self.showChat = true
                                        self.otherUserName = name
                                    }
                                },
                                isActive: $showSearch,
                                label: {
                                    Image(systemName: "magnifyingglass")
                            })
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }.accentColor(.black)
                    .fullScreenCover(isPresented: $model.showingSignIn, content: {
                        SignInView()
                    })
                    .onAppear {
                        guard model.auth.currentUser != nil else {
                            return
                        }
                        model.getConversations()
                    }
                }
            }
        }
    }
    func SignOut() {
        model.SignOut()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView()
    }
}
