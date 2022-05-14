//
//  SignUpView.swift
//  SmartMessenger
//
//  Created by sudohostname on 5/13/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var model: AppStateModel
    
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.white, (Color.init(red: 0.84, green: 0.86, blue: 0.87))]),
              startPoint: UnitPoint(x: 0.2, y: 0.2),
              endPoint: .bottomTrailing
            ).ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("SmartMessenger")
                        .padding(.top, 60)
                        .font(Font.custom("Baloo Thambi 2", size: 45).weight(.bold))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [(Color.init(red: 0.97, green: 0.98, blue: 0.98)), (Color.init(.white))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.6), radius: 2, x: 3, y: 3)
                        .shadow(color: .white, radius: 3, x: -5, y: -5)
                    Text("Start here.")
                        .font(Font.custom("Baloo Thambi 2", size: 23))
                        .padding(.bottom, 30)
                    
                    Text("Enter your E-Mail address")
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                        .padding(.bottom, 10)
                    
                    TextField("Email address", text: $email)
                        .padding()
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.95, green: 0.95, blue: 0.96)))
                        .scaledToFill()
                        .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                        .shadow(color: .white, radius: 3, x: -5, y: -5)
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                        .padding(.bottom, 15)
                    
                    Text("Create username")
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                        .padding(.bottom, 10)
                    
                    
                    TextField("Username", text: $username)
                        .padding()
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.95, green: 0.95, blue: 0.96)))
                        .scaledToFill()
                        .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                        .shadow(color: .white, radius: 3, x: -5, y: -5)
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                        .padding(.bottom, 15)
                    
                    Text("Create password")
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                        .padding(.bottom, 10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.init(red: 0.95, green: 0.95, blue: 0.96)))
                        .scaledToFill()
                        .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                        .shadow(color: .white, radius: 3, x: -5, y: -5)
                        .font(Font.custom("Baloo Thambi 2", size: 18))
                        .padding(.bottom, 30)
                    
                    
                    Button(action: { self.signUp() }, label: {
                        Text("Create account")
                            .foregroundColor(Color.white)
                            .frame(width: 300, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [(Color.init(red: 0.68, green: 0.71, blue: 0.75)), (Color.init(red: 0.36, green: 0.43, blue: 0.49))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                            .shadow(color: Color.init(red: 0.36, green: 0.43, blue: 0.49, opacity: 0.3), radius: 3, x: 5, y: 5)
                            .shadow(color: .white, radius: 3, x: -5, y: -5)
                            .font(Font.custom("Baloo Thambi 2", size: 24).weight(.bold))
                            .padding(.bottom, 10)
                    })
                }
                .padding()
                Spacer()
            }.navigationBarTitle("Create Account", displayMode: .inline)
        }
    }
    func signUp() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        model.SignUp(email: email, username: username, password: password)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
