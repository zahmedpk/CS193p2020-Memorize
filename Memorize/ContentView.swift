//
//  ContentView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) {
                card in
                CardView(card: card, font: viewModel.cards.count >= 10 ? .title : .largeTitle).onTapGesture {
                    viewModel.chooseCard(card: card)
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
        .font(.largeTitle)
    }
}

struct CardView : View {
    static let aspectRatio: CGFloat = 2.0/3.0
    var card: MemoryGame<String>.Card
    var font: Font
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content).font(font)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }.aspectRatio(CardView.aspectRatio, contentMode: .fit)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
