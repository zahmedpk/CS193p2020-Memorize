//
//  CardView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 22/01/2021.
//

import SwiftUI

struct CardView : View {
    static let aspectRatio: CGFloat = 1
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader {
            geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                    Text(card.content)
                } else {
                    if !card.isMatched{
                        RoundedRectangle(cornerRadius: 10.0).fill()
                    }
                }
            }.aspectRatio(CardView.aspectRatio, contentMode: .fit)
            .padding()
            .font(Font.system(size: 0.7 * min(geometry.size.width, geometry.size.height)))
        }
    }
}

