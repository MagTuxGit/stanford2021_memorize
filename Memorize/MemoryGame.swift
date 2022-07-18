//
//  MemoryGame.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/18/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    mutating func choose(_ card: Card) {
        if let cardIndex = index(of: card) {
            cards[cardIndex].isFaceUp.toggle()
        }
    }
    
    func index(of card: Card) -> Int? {
        return cards.firstIndex(where: { $0.id == card.id })
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent

        var id: Int
    }
}
