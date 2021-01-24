//
//  ThemeChooser.swift
//  Memorize
//
//  Created by Zubair Ahmed on 23/01/2021.
//

import SwiftUI

class ThemeStore: ObservableObject {
    @Published var themes: [Theme]
    init() {
        if let arrayOfThemes = UserDefaults.standard.array(forKey: "themes") as? [Theme] {
            self.themes = arrayOfThemes
        } else {
            self.themes = []
            self.themes.append(Self.plants)
            self.themes.append(Self.cars)
            self.themes.append(Self.faces)
            self.themes.append(Self.sports)
            self.themes.append(Self.vegetables)
            self.themes.append(Self.fruits)
            self.themes.append(Self.food)
        }
    }
    
    // MARK:- intents
    func addTheme(){
        let theme = Theme(id: UUID(), numberOfPairs: 3, emojis: ["⚽️", "🏀", "🏈"], name: "Untitled", color: UIColor.gray.rgb)
        self.themes.append(theme)
    }
    func addEmojis(to theme: Theme, addedEmojis: [String]){
        if let index = self.themes.firstIndex(where: {$0.id == theme.id}) {
            self.themes[index].addEmojis(addedEmojis)
        }
    }
    func removeEmoji(from theme: Theme, emoji: String){
        if let index = self.themes.firstIndex(where: {$0.id == theme.id}){
            self.themes[index].removeEmoji(emoji)
        }
    }
    func changeName(of theme: Theme, to name: String) {
        if let index = themes.firstIndex(where: {$0.id == theme.id}){
            themes[index].changeName(to: name)
        }
    }
    func changeColor(of theme: Theme, to color: Color) {
        if let index = themes.firstIndex(where: {$0.id == theme.id}) {
            themes[index].changeColor(to: UIColor(color).rgb)
        }
    }
    func change(numberOfCards number: Int, of theme: Theme) {
        if let index = themes.firstIndex(where: {$0.id == theme.id}) {
            themes[index].setNumberOfCards(number)
        }
    }
}


extension ThemeStore {
    static var plants: Theme = Theme(id: UUID(), numberOfPairs: 3, emojis: ["🌱", "🌿", "☘️"], name: "Plants", color: UIColor.RGB(red: 79/255, green: 184/255, blue: 38/255 , alpha: 1))
    static var fruits: Theme = Theme(id: UUID(), numberOfPairs: 6, emojis: ["🍏", "🍊", "🍇", "🍓", "🍒","🍑"], name: "Fruits", color: UIColor.red.rgb)
    static var food: Theme = Theme(id: UUID(), numberOfPairs: 5, emojis: ["🍣","🍛","🍲","🍕","🍟"], name: "Food", color: UIColor.systemYellow.rgb)
    static var vegetables: Theme = Theme(id: UUID(), numberOfPairs: 5, emojis: ["🍆", "🥔","🧅","🍠","🥬"], name: "Vegetables", color: UIColor.RGB(red: 79/255, green: 184/255, blue: 38/255 , alpha: 1))
    static var faces: Theme = Theme(id: UUID(), numberOfPairs: 4, emojis: ["😡","🤬","🤯","😳"], name: "Faces", color: UIColor.systemPink.rgb)
    static var sports: Theme = Theme(id: UUID(), numberOfPairs: 6, emojis: ["🥎","🏐","🏀","🏏","🏸","🏓"], name: "Sports", color: UIColor.blue.rgb)
    static var cars: Theme = Theme(id: UUID(), numberOfPairs: 5, emojis: ["🚗","🚕","🚙","🚌","🚎"], name: "Vehicles", color: UIColor.gray.rgb)
    
}
