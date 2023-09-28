//
//  LikesButton.swift
//  MyEcoTribe
//
//  Created by Sylvain Leguay on 21/09/2023.
//

import SwiftUI

struct LikesButton: View {

    let primaryColor =  Color(red: 0.2784313725490196, green: 0.7333333333333333, blue: 0.11764705882352941)
    
    @Binding var isLiked: Bool
    
    @State var likesCount: Int
    
    var body: some View {
        HStack {
            withAnimation() {
                Text(isLiked ? "\(likesCount + 1)" : "\(likesCount)")
                    .rotation3DEffect(.degrees(360), axis: (x: 0, y: 1, z: 0))
            }
            Button(action: {
//                withAnimation(.interactiveSpring(duration: 1) ) {
                    isLiked.toggle()
//                }
            }, label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(primaryColor)
            })
        }
    }
}

struct LikesButton_Previews: PreviewProvider {
    
    @State static var isLiked: Bool = false
    @State static var likesCount: Int = 3
    

    static var previews: some View {
        LikesButton(isLiked: $isLiked, likesCount: likesCount)

    }
}
