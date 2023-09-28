//
//  AccountCreationView.swift
//  MyEcoTribe
//
//  Created by Apprenant 41 on 26/09/2023.
//

import SwiftUI
import PhotosUI

struct AccountCreationView: View {
    
    @State var lastName: String = ""
    @State var firstName: String = ""
    @State var pseudo: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    @State var adresseMail: String = ""
    @State var showSecondView: Bool = false
    @State private var connexion = false
    @State private var showPassword: Bool = false
    @State private var showPasswordConfirmation: Bool = false
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    var userData: UserData
    
    var isSignInButtonDisabled: Bool {
        [lastName, firstName, pseudo, password, passwordConfirmation, adresseMail].contains(where: \.isEmpty)
    }
    
    var MailIncorrect: Bool {
        adresseMail != adresseMail
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 15) {
                    Text("Création du compte")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    ZStack {
                        if let avatarImage {
                            avatarImage
                                .resizable()
                                .foregroundColor(appColorsGreen)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                        }
                        else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundColor(appColorsGreen)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                        }
                        Group {
                        PhotosPicker(selection: $avatarItem, matching: .images) {
                            HStack(spacing: 15) {
                                if let avatarImage {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .foregroundColor(appColorsGreen)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .padding(.top, 150)
                                        .padding(.leading, 2)
                                }
                                else {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .padding(.top, 150)
                                        .padding(.leading, 2)
                                }
                            }
                        } .onChange(of: avatarItem) { _ in
                            Task {
                                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                                    if let uiImage = UIImage(data: data) {
                                        avatarImage = Image(uiImage: uiImage)
                                        return
                                    }
                                }
                                print("Failed")
                            }
                        }
                    }
                }
                    
                    Spacer()
                    
                    Text("Nom :")
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 40)
                            .foregroundColor(appColorsLightGreen)
                            .shadow(radius: 5)
                        
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .padding(.leading, 30)
                            
                            TextField("Nom",
                                      text: $lastName)
                            .textInputAutocapitalization(.never)
                            .padding(.leading, 1)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Prénom :")
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 40)
                            .foregroundColor(appColorsLightGreen)
                            .shadow(radius: 5)
                        
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .padding(.leading, 30)
                            
                            TextField("Prénom",
                                      text: $firstName)
                            .textInputAutocapitalization(.never)
                            .padding(.leading, 1)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Pseudo :")
                    
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
                                      text: $pseudo)
                            .textInputAutocapitalization(.never)
                            .padding(.leading, 1)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Mot de passe :")
                    
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
                                        TextField("",
                                                  text: $password).textInputAutocapitalization(.never)
                                    } else {
                                        SecureField("Mot de passe",
                                                    text: $password)
                                        .textInputAutocapitalization(.never)
                                        .padding(.leading, 1)}
                                    
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
                    
                    Spacer()
                    
                    Text("Confirmation du mot de passe :")
                    
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
                                    if showPasswordConfirmation {
                                        TextField("",
                                                  text: $passwordConfirmation).textInputAutocapitalization(.never)
                                    } else {
                                        SecureField("Mot de passe",
                                                    text: $passwordConfirmation)
                                        .textInputAutocapitalization(.never)
                                        .padding(.leading, 1)}
                                    
                                    Button(action: {
                                        showPasswordConfirmation.toggle()
                                    }, label: {
                                        Image(systemName: showPasswordConfirmation ? "eye.slash.fill" : "eye.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 30)
                                    })
                                }
                            }
                            
                        }
                    }
                    
                    Spacer()
                    
                    Text("Adresse mail :")
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 40)
                            .foregroundColor(appColorsLightGreen)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        MailIncorrect ?
                                        LinearGradient(colors: [.red], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                            LinearGradient(colors: [appColorsLightGreen], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1))
                            .disabled(MailIncorrect)
                            .shadow(radius: 5)
                        
                        HStack {
                            Image(systemName: "at")
                                .foregroundColor(.gray)
                                .padding(.leading, 30)
                            TextField("Adresse e-mail",
                                      text: $adresseMail ,
                                      prompt: Text("Adresse e-mail"))
                            .textInputAutocapitalization(.never)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        showSecondView.toggle()
                    } label: {
                        Text("Continuer")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 40)
                    .background(
                        isSignInButtonDisabled ?
                        LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                            LinearGradient(colors: [appColorsGreen], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    .disabled(isSignInButtonDisabled)
                    .navigationDestination(isPresented: $showSecondView) {
                        AccountConfirmationView(userData: users[1])
                        .navigationBarBackButtonHidden(true)
                    }
                    .padding(.top, 25)
                }
            }
        }
    }
}
struct AccountCreationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreationView(userData: users[1])
    }
}
