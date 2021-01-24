//
//  Theme.swift
//  Memorize
//
//  Created by Zubair Ahmed on 23/01/2021.
//

import SwiftUI

struct Theme: Codable, Identifiable, CustomStringConvertible {
    var description: String {
        return "\(name): \(emojis)"
    }
    
    var id: UUID
    var numberOfPairs: Int
    var emojis: Set<String>
    var name: String
    var color: UIColor.RGB
    mutating func addEmojis(_ addedEmojis: [String]){
        for emoji in addedEmojis {
            emojis.insert(emoji)
        }
    }
    mutating func removeEmoji(_ emoji: String) {
        if let index = self.emojis.firstIndex(where: {$0 == emoji}){
            if self.emojis.count > self.numberOfPairs {
                self.emojis.remove(at: index)
            }
        }
    }
    func possibleNumberOfCards() -> [Int] {
        return (Self.MinimumPairsAllowed...self.emojis.count).map {$0 * 2}
    }
    mutating func setNumberOfCards(_ number: Int) {
        self.numberOfPairs = number/2
    }
    mutating func changeName(to name: String) {
        if name.count > 3 {
            self.name = name
        }
    }
    mutating func changeColor(to color: UIColor.RGB) {
        self.color = color
    }
}


extension Theme {
    static let MinimumPairsAllowed = 3
}
