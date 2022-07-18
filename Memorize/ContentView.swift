//
//  ContentView.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var cardsCount: Int {
        viewModel.cards.count
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: cardsCount)))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            //            HStack {
            //                ForEach(themes, id: \.self.icon) { theme in
            //                    Button(action: {
            //                        emojis = theme.emojis.shuffled()
            //                        emojiCount = Int.random(in: 4...emojis.count)
            //                    }, label: {
            //                        VStack {
            //                            Image(systemName: theme.icon).font(.largeTitle)
            //                            //Text(theme.icon).font(.largeTitle)
            //                            Text(theme.title).font(.subheadline)
            //                        }
            //                    }).padding(.horizontal)
            //                }
            //            }.padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        if cardCount <= 16 {
            return 70
        }
        return 65
    }
}

struct Theme {
    let icon: String
    let title: String
    let emojis: [String]
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        //        ContentView()
        //            .preferredColorScheme(.dark)
        //            .previewInterfaceOrientation(.landscapeLeft)
    }
}
