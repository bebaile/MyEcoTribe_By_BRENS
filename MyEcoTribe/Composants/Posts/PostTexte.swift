//
//  PostTexte.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct PostTexte: View {
    
    @State var isLiked = false

    var post: PostData
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 320, height: 100)
                .foregroundColor(.white)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 20,
                        bottomTrailingRadius: 5,
                        topTrailingRadius: 20
                    )
                ).shadow(radius: 5)
            VStack(alignment: .leading) {
                Text("\(post.title) :")
                    .padding(.bottom, 5)
                    .padding(.leading, 30)
                HStack(alignment: .bottom) {
                    Text(post.description)
                        .font(.footnote)
                        .fontWeight(.ultraLight)
                        .padding(.bottom)
                    Spacer()
                    VStack(alignment: .trailing) {
                        LikesButton(isLiked: $isLiked, likesCount: post.likesCount)
                        Text(post.sendTime)
                            .foregroundColor(.gray)
                    }   .font(.caption)
                }
            }.padding(.horizontal, 50)
            
            Image(post.postAvatar)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(.white, lineWidth: 2))
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.bottom, 100)
                .padding(.trailing, 320)
                .shadow(radius: 2)
        }.padding()
       
    }
}

struct PostTexte_Previews: PreviewProvider {
    static var previews: some View {
        PostTexte(post:PostData(title: "Emilien", postAvatar: "emilien", description: "J'ai enfin trouvé la déchetterie dans le 15ème !", likesCount: 32, sendTime: "il y a 5 min"))
    }
}
