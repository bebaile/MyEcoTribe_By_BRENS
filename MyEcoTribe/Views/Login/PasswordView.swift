//
//  PasswordView.swift
//  MyEcoTribe
//
//  Created by Apprenant 41 on 25/09/2023.
//

import SwiftUI

struct PasswordView: View {
    
    @State var adresseMail: String = ""
    @State var showSecondView: Bool = false
    @State private var continuer = false
    var userData: UserData
    var isSignInButtonDisabled: Bool {
        [adresseMail].contains(where: \.isEmpty)
        
    }
    var MailIncorrect: Bool {
        adresseMail != adresseMail
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Réinitialiser le mot de passe")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 20)
                
                Image("LogoApp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.leading, 85)
                    .padding(.bottom, 50)
                
                
                Text("Saissisez l'adresse e-mail que vous utilisez avec votre compte pour continuer.")
                    .font(.title3)
                    .padding(.top, -50)
                    .padding(.bottom)
                    .padding(.leading, 20)
                
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
                    
                    TextField("Adresse e-mail",
                              text: $adresseMail ,
                              prompt: Text("Adresse e-mail").foregroundColor(.gray))
                    .textInputAutocapitalization(.never)
                    .padding(.leading, 20)
                }
                
                .padding()
                
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
                .navigationDestination(isPresented: $showSecondView) {
                    MailVerificationView(userData: users[1])
                        .navigationBarBackButtonHidden(true)
                }
                
                .disabled(isSignInButtonDisabled)
                .padding(.leading, 40)
                
                Spacer()
                
            }
        }
    }
}


struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(userData: users[1])
    }
}
