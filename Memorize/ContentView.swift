//
//  ContentView.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = [ "🚗", "🚌", "🚛", "✈️", "🚀", "🚢", "🚲", "🏍", "🚂", "🚁", "⛵️", "🚒", "🚜", "🛵", "🚤", "🚑", "🛴", "🛺", "🚋", "🚆", "🛩", "🛸", "🛶", "🛳"]
    
    var emojiCount = 6
    
    var body: some View {
        HStack {
            ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                CardView(content: emoji)
            }
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    var content: String
    
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
