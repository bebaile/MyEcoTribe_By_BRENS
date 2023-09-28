//
//  PostPhoto.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct PostPhoto: View {
    
    @State var isLiked = false
            
    var post: PostData

    var body: some View {
        
        ZStack {
            VStack {
                if let photo = post.postPhoto
                {
                    ZStack {
                        HStack(alignment: .bottom) {
                            Text(post.description)
                                .font(.footnote)
                                .fontWeight(.ultraLight)
                                .padding()
                            Spacer()
                            VStack(alignment: .trailing) {
                                LikesButton(isLiked: $isLiked, likesCount: post.likesCount) // widgets du bouton Likes
                                Text(post.sendTime)
                                    .foregroundColor(.gray)
                            }.font(.caption)
                                .padding(8)
                        }
                        .padding(.top,20)
                        .background(.white)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 5,
                                topTrailingRadius: 0
                            )
                        )
                        .frame(width: 320, height: 150)
                        .padding(.top, 90)
                        
                        photo                          
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 320, height: 150)
                            .padding(.bottom, 100)
                    }
                }
            }.shadow(radius: 5)
            
            Image(post.postAvatar)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(.white, lineWidth: 2))
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.bottom, 240)
                .padding(.trailing, 320)
                .shadow(radius: 2)
            
        }
        
    }
}

struct PostPhoto_Previews: PreviewProvider {
    static var previews: some View {
        PostPhoto(post:PostData(title: "Renaud", postPhoto: Image("debrancherPost"), postAvatar: "renaud", description: "J'ai débranché toutes mes prises avant de partir en vacances ! 😆", likesCount: 15, sendTime: "il y a 5 min"))
    }
}
