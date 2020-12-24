//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//
// the view model

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame = EmojiMemoryGame.createModel()
    static var themes: [Theme] = {
        var themes = [Theme]()
        themes.append(Theme(minNumberOfPairs: 4, maxNumberOfPairs: 5, emojis: ["🍏", "🍊", "🍇", "🍓", "🍒","🍑"], name: "Fruits", color: .red))
        themes.append(Theme(minNumberOfPairs: 5, maxNumberOfPairs: 5, emojis: ["🍣","🍛","🍲","🍕","🍟"], name: "Food", color: .yellow))
        themes.append(Theme(minNumberOfPairs: 4, maxNumberOfPairs: 5, emojis: ["🍆", "🥔","🧅","🍠","🥬"], name: "Vegetables", color: .green))
        themes.append(Theme(minNumberOfPairs: 4, maxNumberOfPairs: 4, emojis: ["😡","🤬","🤯","😳"], name: "Faces", color: .pink))
        themes.append(Theme(minNumberOfPairs: 4, maxNumberOfPairs: 5, emojis: ["🥎","🏐","🏀","🏏","🏸","🏓"], name: "Sports", color: .blue))
        themes.append(Theme(minNumberOfPairs: 5, maxNumberOfPairs: 5, emojis: ["🚗","🚕","🚙","🚌","🚎"], name: "Vehicles", color: .gray))
        return themes
    }()
    static var currentTheme: Theme?
    static func createModel() -> MemoryGame<String> {
        let randomTheme = themes.randomElement()!
        currentTheme = randomTheme
        let emojis = randomTheme.emojis
        let numberOfPairs = Int.random(in: randomTheme.minNumberOfPairs...randomTheme.maxNumberOfPairs)
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
    func startNewGame(){
        model = Self.createModel()
    }
    var score: Int {
        return model.score
    }
    var currentThemeName: String {
        let currentTheme = Self.currentTheme!
        return currentTheme.name
    }
    var currentThemeColor: Color {
        let currentTheme = Self.currentTheme!
        return currentTheme.color
    }
    struct Theme {
        let minNumberOfPairs: Int
        let maxNumberOfPairs: Int
        let emojis: [String]
        let name: String
        let color: Color
    }
}
