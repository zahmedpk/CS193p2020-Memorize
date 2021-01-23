//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//
// the view model

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    let theme: Theme
    @Published private var model: MemoryGame<String>
    init(theme: Theme) {
        self.theme = theme
        self.model = Self.createModel(from: theme)
    }
    static func createModel(from theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis
        return MemoryGame<String>(numberOfPairs: theme.numberOfPairs) {
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
        withAnimation {
            model.choose(card: card)
        }
    }
    func startNewGame(){
        withAnimation {
            model = Self.createModel(from: self.theme)
        }
    }
    var score: Int {
        return model.score
    }
    var currentThemeName: String {
        return theme.name
    }
    var currentThemeColor: Color {
        return Color(theme.color)
    }
}

extension Data {
    var utf8 : String? {
        String(data: self, encoding: .utf8)
    }
}
