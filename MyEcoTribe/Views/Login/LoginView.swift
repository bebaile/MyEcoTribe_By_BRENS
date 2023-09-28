//
//  LoginView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 22/09/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var pseudo: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var showSecondView: Bool = false
    @State var showThirdView: Bool = false
    var userData: UserData
    
    var isSignInButtonDisabled: Bool {
        [pseudo, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        NavigationStack {
         
                
            VStack(alignment: .center, spacing: 15) {
                
                HStack {
                    Text("MyEcoTribe")
                        .foregroundColor(appColorsGreen)
                        .font(.title)
                        .fontWeight(.bold)
                    .padding(.bottom)
                    .padding(.leading)
                      
                }
                
                Spacer()
                Image(userData.profilePhoto)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(.white, lineWidth: 4))
                    .shadow(radius: 2)
                    .padding(.bottom,50)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 40)
                        .foregroundColor(appColorsLightGreen)
                        .shadow(radius: 5)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .padding(.leading, 30)
                        
                        TextField("Pseudo",
                                  text: $pseudo ,
                                  prompt: Text("Pseudo").foregroundColor(.gray)
                        )
                        .textInputAutocapitalization(.never)
                        
                    }
                }
                
                HStack {
                    Group {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 40)
                                .foregroundColor(appColorsLightGreen)
                                .shadow(radius: 5)
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 30)
                                if showPassword {
                                    TextField("Password",
                                              text: $password,
                                              prompt: Text("Mot de passe").foregroundColor(.red))
                                    .textInputAutocapitalization(.never)
                                } else {
                                    SecureField("Password",
                                                text: $password,
                                                prompt: Text("Mot de passe").foregroundColor(.gray))
                                    .textInputAutocapitalization(.never)
                                    }
                                
                                Button(action: {
                                    showPassword.toggle()
                                }, label: {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 30)
                                })
                            }
                        }
                    }
                }
                .padding(.top, 10)
                
                Button {
                    showSecondView.toggle()
                } label: {
                    Text("Connexion")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .frame(width: 300, height: 40)
                .shadow(radius: 5)
                .background(
                    isSignInButtonDisabled ?
                    LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                        LinearGradient(colors: [appColorsGreen], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(30)
                .disabled(isSignInButtonDisabled)
                                .navigationDestination(isPresented: $showSecondView) {
                                    LandingView()
                                }
                .padding(.top, 25)
                
                Button {
                    showThirdView.toggle()
                } label: {
                    Text("Inscription")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .frame(width: 300, height: 40)
                .foregroundColor(.white)
                .background(RoundedRectangle(
                    cornerRadius: 30,
                    style: .continuous
                )
                    .stroke(appColorsGreen, lineWidth: 2))
                .cornerRadius(30)
                .shadow(radius: 5)
                .navigationDestination(isPresented: $showThirdView) {
                AccountCreationView(userData: UserData(pseudo: "", lastName: "", firstName: "", profilePhoto: "", ecoScore: 0, biography: ""))
                }
                .padding(.top, 15)
                
                NavigationLink(destination: PasswordView(userData: UserData(pseudo: "", lastName: "", firstName: "", profilePhoto: "", ecoScore: 0, biography: ""))) {
                Text("J'ai oublié mon mot de passe")
                .font(.body)
                .foregroundColor(.blue)
                .padding(.top, 20)
                                }
                
                Spacer()
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userData: users[1])
    }
}
