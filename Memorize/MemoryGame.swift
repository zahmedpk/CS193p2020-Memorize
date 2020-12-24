//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zubair Ahmed on 21/12/2020.
//

// Provide game play logic

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: [Card]
    mutating func choose(card: Card){
        if card.isFaceUp || card.isMatched {
            return
        }
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }){
            //check how many cards are face up
            let faceUpCards = cards.filter { $0.isFaceUp }
            if faceUpCards.count == 0 {
                cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
            } else if faceUpCards.count == 1, faceUpCards.first?.id != card.id {
                if card.content == faceUpCards.first?.content {//match
                    cards[chosenIndex].isMatched = true
                    cards[chosenIndex].isFaceUp = true
                    if let indexOfFaceUpCard = cards.firstIndex(where: {$0.id == faceUpCards.first?.id}){
                        cards[indexOfFaceUpCard].isMatched = true
                    }
                } else {//not matching
                    cards[chosenIndex].isFaceUp = true
                }
            } else { // two cards already in face up state
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
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
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
