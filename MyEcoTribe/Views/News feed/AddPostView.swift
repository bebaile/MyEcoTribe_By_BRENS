//
//  AddPost.swift
//  MyEcoTribe
//
//  Created by Sylvain Leguay on 25/09/2023.
//

import SwiftUI
import PhotosUI


struct AddPostView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var postFeed: PostFeed
    
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var isPostValid = false
    
    @State var postDescription: String = ""
    
    
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
            Spacer()
            Group {
                PhotosPicker(selection: $avatarItem, matching: .images) {
                    HStack(spacing: 15) {
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 20, height: 17)
                        Text("Image")
                        Spacer()
                        Image(systemName: "plus")
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
            .foregroundColor(.black)
            .padding(.horizontal, 40)
            
            TextField("Pseudo",
                      text: $postDescription ,
                      prompt: Text("On t'écoute").foregroundColor(.gray)
            )
            .frame(maxWidth: 350, maxHeight: 200, alignment: .top)
            
            .padding(.top)
            if let avatarImage {
                avatarImage
                    .resizable()
                    .cornerRadius(30)
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
            }
            else {
                HStack{ }.frame(width: 300, height: 300, alignment: .center)
            }
            
            Button(action: {
                savePost(postDescription: postDescription, image: avatarImage)
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
            Spacer()
        }
    }
    
    func savePost(postDescription: String, image: Image?) {
        let newPost = PostData(
            title: "Sylvain",
            postPhoto: image,
            postAvatar: "sylvain",
            description: postDescription,
            likesCount: 0,
            sendTime: "Il y a 1 min"
        )
        
        postFeed.postFeed.append(newPost)
        
    }
}

#Preview {
    AddPostView()
}
