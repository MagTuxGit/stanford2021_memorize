//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/18/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let themes = [
        Theme(icon: "car", title: "Vehicles", emojis: [ "🚗", "🚌", "🚛", "✈️", "🚀", "🚢", "🚲", "🏍", "🚂", "🚁", "⛵️", "🚒", "🚜", "🛵", "🚤", "🚑", "🛴", "🛺", "🚋", "🚆", "🛩", "🛸", "🛶", "🛳"]),
        Theme(icon: "hare", title: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷"]),
        Theme(icon: "applelogo", title: "Fruits", emojis: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🍍", "🥥", "🥝"])
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            // theme chooser ?
            themes.first!.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
        //objectWillChange.send()
    }
}
