//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/1/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
