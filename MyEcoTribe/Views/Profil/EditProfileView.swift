//
//  EditProfileView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 25/09/2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State  var profilePhoto: String
    @Binding  var profileImage: Image?
    @State  var profileItem: PhotosPickerItem?
    @Binding  var pseudo: String
    @Binding  var biography: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
         
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Annuler")
            })
                Spacer()
            }.padding()
            ZStack(alignment: .bottomTrailing) {
                if let profileImage {
                    profileImage
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                        .overlay(Circle()
                            .stroke(.white, lineWidth: 5))
                } else {
                    Image(profilePhoto)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                        .overlay(Circle()
                            .stroke(.white, lineWidth: 5))
                }
                
                PhotosPicker(selection: $profileItem, matching: .images) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .background(.white)
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                            .overlay(Circle()
                                .stroke(.white, lineWidth: 2))
                    }
                }
            }.padding()
            .onChange(of: profileItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            profileImage = Image(uiImage: uiImage)
                            // Set the profilePhoto to a unique identifier for this image
                            profilePhoto = UUID().uuidString
                            return
                        }
                    }
                    
                    print("Failed to load image")
                }
            }
            
            Form {
                Section(header: Text("Pseudo")) {
                    TextField(text: $pseudo, prompt: Text("Pseudo"), axis: .vertical) {
                        Text("Title")
                    }
                }
                 
                Section(header: Text("Biographie")) {
                    TextField(text: $biography, prompt: Text("Biographie"), axis: .vertical) {
                        Text("Title")
                    }.lineLimit(10)
                }
            }
            
            Button(action: {
                saveProfile()
                dismiss()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(appColorsGreen)
                        .frame(width: 350, height: 40)
                        .shadow(radius: 5)
                    Text("Enregistrer")
                        .foregroundColor(.white)
                    
                }
            }).padding()
            
        }
    }
    
    
    func saveProfile() {
        
    }
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(profilePhoto: "renaud", profileImage: .constant(Image("renaud")), pseudo: .constant("Renaud"), biography: .constant("🌿 | Amoureux de la nature 🌍 | Défenseur des forêts et des océans 🌳🌊 | En quête de solutions durables 🤝 | Ensemble, faisons la différence pour notre planète! 🌎 #Écologie #ChangementClimatique"))
    }
}
