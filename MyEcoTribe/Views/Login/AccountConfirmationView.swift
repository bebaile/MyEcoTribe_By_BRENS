//
//  AccountConfirmationView.swift
//  MyEcoTribe
//
//  Created by Apprenant 41 on 26/09/2023.
//

import SwiftUI

struct AccountConfirmationView: View {
    
    @State var showSecondView: Bool = false
    @State private var continuer = false
    var userData: UserData
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Création du compte")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 20)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding(.leading, 75)
                    .padding(.bottom, 50)
                
                
                Text("Votre compte a bien été créé.")
                    .font(.title3)
                    .padding(.top, -50)
                    .padding(.bottom)
                    .padding(.leading, 40)
                
                
                Button {
                    showSecondView.toggle()
                } label: {
                    Text("C'est parti !")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .frame(width: 340, height: 40)
                .background((appColorsGreen)
                )
                .cornerRadius(30)
                .shadow(radius: 5)
                .navigationDestination(isPresented: $showSecondView) {
                    SituationView()
                        .navigationBarBackButtonHidden(true)
                }
                .padding(.leading, 5)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    AccountConfirmationView(userData: users[1])
}
