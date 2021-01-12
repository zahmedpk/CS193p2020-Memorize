//
//  ContentView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack{
            GridView(viewModel.cards) {
                card in
                CardView(card: card)
                    .onTapGesture {
                    viewModel.chooseCard(card: card)
                }
            }
            .foregroundColor(viewModel.currentThemeColor)
            .padding()
            HStack {
                Button("New Game", action: {
                    viewModel.startNewGame()
                })
                Text("Score: \(viewModel.score)")
                Text("Theme: \(viewModel.currentThemeName)")
                
            }
        }
    }
}

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
