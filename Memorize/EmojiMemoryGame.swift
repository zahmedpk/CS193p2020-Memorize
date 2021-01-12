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
        themes.append(Theme(numberOfPairs: 6, emojis: ["🍏", "🍊", "🍇", "🍓", "🍒","🍑"], name: "Fruits", color: UIColor.red.rgb))
        themes.append(Theme(numberOfPairs: 5, emojis: ["🍣","🍛","🍲","🍕","🍟"], name: "Food", color: UIColor.yellow.rgb))
        themes.append(Theme(numberOfPairs: 5, emojis: ["🍆", "🥔","🧅","🍠","🥬"], name: "Vegetables", color: UIColor.green.rgb))
        themes.append(Theme(numberOfPairs: 4, emojis: ["😡","🤬","🤯","😳"], name: "Faces", color: UIColor.systemPink.rgb))
        themes.append(Theme(numberOfPairs: 6, emojis: ["🥎","🏐","🏀","🏏","🏸","🏓"], name: "Sports", color: UIColor.blue.rgb))
        themes.append(Theme(numberOfPairs: 5, emojis: ["🚗","🚕","🚙","🚌","🚎"], name: "Vehicles", color: UIColor.gray.rgb))
        return themes
    }()
    static var currentTheme: Theme?
    static func createModel() -> MemoryGame<String> {
        let randomTheme = themes.randomElement()!
        let jsonData = try! JSONEncoder().encode(randomTheme)
        if let jsonString = jsonData.utf8 {
            print("Chosen theme in json: \(jsonString)")
        }
        currentTheme = randomTheme
        let emojis = randomTheme.emojis
        return MemoryGame<String>(numberOfPairs: randomTheme.numberOfPairs) {
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
            model = Self.createModel()
        }
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
        return Color(currentTheme.color)
    }
    struct Theme: Codable {
        let numberOfPairs: Int
        let emojis: [String]
        let name: String
        let color: UIColor.RGB
    }
}

extension Data {
    var utf8 : String? {
        String(data: self, encoding: .utf8)
    }
}
