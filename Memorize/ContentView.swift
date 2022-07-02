//
//  ContentView.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = [ "🚗", "🚌", "🚛", "✈️", "🚀", "🚢", "🚲", "🏍", "🚂", "🚁", "⛵️", "🚒", "🚜", "🛵", "🚤", "🚑", "🛴", "🛺", "🚋", "🚆", "🛩", "🛸", "🛶", "🛳"]
    
    @State var emojiCount = 12
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                    }
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            HStack {
                removeCardButton
                Spacer()
                addCardButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var addCardButton: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount+=1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var removeCardButton: some View {
        Button(action: {
            if emojiCount > 0 {
                emojiCount-=1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
}

struct CardView: View {
    var content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }.aspectRatio(2/3, contentMode: .fit)
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
