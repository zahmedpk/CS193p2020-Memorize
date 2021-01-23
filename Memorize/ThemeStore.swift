//
//  ThemeChooser.swift
//  Memorize
//
//  Created by Zubair Ahmed on 23/01/2021.
//

import SwiftUI

class ThemeStore: ObservableObject {
    var themes: [Theme]
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
}


extension ThemeStore {
    static var plants: Theme = Theme(id: UUID(), numberOfPairs: 3, emojis: ["🌱", "🌿", "☘️"], name: "Plants", color: UIColor.RGB(red: 0, green: 1, blue: 0, alpha: 1))
    static var fruits: Theme = Theme(id: UUID(), numberOfPairs: 6, emojis: ["🍏", "🍊", "🍇", "🍓", "🍒","🍑"], name: "Fruits", color: UIColor.red.rgb)
    static var food: Theme = Theme(id: UUID(), numberOfPairs: 5, emojis: ["🍣","🍛","🍲","🍕","🍟"], name: "Food", color: UIColor.yellow.rgb)
    static var vegetables: Theme = Theme(id: UUID(), numberOfPairs: 5, emojis: ["🍆", "🥔","🧅","🍠","🥬"], name: "Vegetables", color: UIColor.green.rgb)
    static var faces: Theme = Theme(id: UUID(), numberOfPairs: 4, emojis: ["😡","🤬","🤯","😳"], name: "Faces", color: UIColor.systemPink.rgb)
    static var sports: Theme = Theme(id: UUID(), numberOfPairs: 6, emojis: ["🥎","🏐","🏀","🏏","🏸","🏓"], name: "Sports", color: UIColor.blue.rgb)
    static var cars: Theme = Theme(id: UUID(), numberOfPairs: 5, emojis: ["🚗","🚕","🚙","🚌","🚎"], name: "Vehicles", color: UIColor.gray.rgb)
    
}
