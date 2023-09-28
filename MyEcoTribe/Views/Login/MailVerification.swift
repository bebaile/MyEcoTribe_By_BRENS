//
//  MailVerification.swift
//  MyEcoTribe
//
//  Created by Apprenant 41 on 26/09/2023.
//

import SwiftUI

struct MailVerificationView: View {
    
    @State var showSecondView: Bool = false
    @State private var continuer = false
    var userData: UserData
    
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
                
                    
                Text("Un mail de vérification vous a été envoyé à votre adresse mail. Merci de cliquer sur le lien de vérification.")
                    .font(.title3)
                    .padding(.top, -50)
                    .padding(.bottom)
                    .padding(.leading)
                
                
                Button {
                    showSecondView.toggle()
                } label: {
                    Text("Retour à la page de connexion")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .frame(width: 340, height: 40)
                .background((appColorsGreen)
                )
                .cornerRadius(30)
                .shadow(radius: 5)
                .navigationDestination(isPresented: $showSecondView) {
                    LoginView(userData: users[1])
                        .navigationBarBackButtonHidden(true)
                }
                .padding(.leading, 26)
                
                Spacer()
                
                }
            }
        }
    }


struct MailVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        MailVerificationView(userData: users[1])
    }
}
