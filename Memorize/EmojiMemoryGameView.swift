//
//  ContentView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack{
            GridView(viewModel.cards) {
                card in
                CardView(card: card)
                    .padding(3)
                    .onTapGesture { viewModel.chooseCard(card: card) }
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
//    }
//}
