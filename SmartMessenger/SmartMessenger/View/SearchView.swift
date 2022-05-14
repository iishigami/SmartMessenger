//
//  SearchView.swift
//  SmartMessenger
//
//  Created by sudohostname on 5/14/22.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var model: AppStateModel
    
    @State var text: String = ""
    @State var usernames: [String] = []

    let completion: ((String) -> Void)
    
    init(completion: @escaping ((String) -> Void)) {
        self.completion = completion
        
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().sectionIndexBackgroundColor = .clear
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.white, (Color.init(red: 0.84, green: 0.86, blue: 0.87))]),
              startPoint: UnitPoint(x: 0.2, y: 0.2),
              endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            
            VStack {
                Text("Find friends by username")
                    .font(Font.custom("Baloo Thambi 2", size: 23))
                    .padding(.bottom, 10)
                
                HStack {
                    TextField("Search", text: $text)
                        .padding()
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.95, green: 0.95, blue: 0.96)))
                        .scaledToFill()
                        .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                        .shadow(color: .white, radius: 3, x: -5, y: -5)
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                    
                    Button(action: {
                        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                            return
                        }
                        model.searchUsers(queryText: text) { usernames in
                            self.usernames = usernames
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
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
                
                List {
                    
                    Group {
                        ForEach(usernames, id: \.self) { name in
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
                                    .font(Font.custom("Baloo Thambi 2", size: 18))
                                    .padding()
                                Spacer()
                                
                            }
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                                completion(name)
                            }
                        }
                    }
                }.listStyle(InsetGroupedListStyle())
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView() { _ in }
    }
}
