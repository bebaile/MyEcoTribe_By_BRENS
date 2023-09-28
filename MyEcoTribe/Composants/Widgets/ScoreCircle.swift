//
//  ScoreCircle.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct ScoreCircle: View {
    
    @Binding var tailleCercle:Double
    @Binding var score:Double
    
    var body: some View {
        
        
        ZStack {
            
            Text("\(Int(score))")
                .font(.system(size: tailleCercle/4))
            Circle()
                .trim(from: 0, to: score/100)
                .stroke(
                    Color.green.opacity(0.8),
                    // Style avec ligne de 10 et bords ronds
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    ))
                .frame(width: tailleCercle)
                .rotationEffect(.degrees(-90))
            Circle()
                .stroke(
                    Color.gray.opacity(0.3),
                    // Style avec ligne de 10 et bords ronds
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    ))
                .frame(width: tailleCercle)
                .rotationEffect(.degrees(-90))

        }
        
    }
}

struct ScoreCircle_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCircle(tailleCercle: .constant(110), score: .constant(58))
    }
}
