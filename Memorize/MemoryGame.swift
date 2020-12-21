//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//

// Provide game play logic

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    func choose(card: Card){
        print("card chosen: \(card)")
    }
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for index in 0..<numberOfPairs {
            let card1 = Card(id: UUID(), content: cardContentFactory(index))
            let card2 = Card(id: UUID(), content: cardContentFactory(index))
            cards.append(card1)
            cards.append(card2)
        }
        cards.shuffle()
    }
    struct Card: Identifiable {
        var id: UUID
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
