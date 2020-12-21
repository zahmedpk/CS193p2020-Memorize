//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//
// the view model

import Foundation

class EmojiMemoryGame {
    private var model: MemoryGame = EmojiMemoryGame.createModel()
    
    static func createModel() -> MemoryGame<String> {
        let emojis = ["🍏", "🍊", "🍇", "🍓", "🍒"]
        let numberOfPairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairs: numberOfPairs) {
            pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intents
    func chooseCard(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
