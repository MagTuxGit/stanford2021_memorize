//
//  ContentView.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/1/22.
//

import SwiftUI

let themes = [
    Theme(icon: "car", title: "Vehicles", emojis: [ "🚗", "🚌", "🚛", "✈️", "🚀", "🚢", "🚲", "🏍", "🚂", "🚁", "⛵️", "🚒", "🚜", "🛵", "🚤", "🚑", "🛴", "🛺", "🚋", "🚆", "🛩", "🛸", "🛶", "🛳"]),
    Theme(icon: "hare", title: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁", "🐮", "🐷"]),
    Theme(icon: "applelogo", title: "Fruits", emojis: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🍍", "🥥", "🥝"])
]

struct ContentView: View {
    @State var emojis = themes.first!.emojis
    @State var emojiCount = 16
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
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
            HStack {
                ForEach(themes, id: \.self.icon) { theme in
                    Button(action: {
                        emojis = theme.emojis.shuffled()
                        //emojiCount = Int.random(in: 4...emojis.count)
                    }, label: {
                        VStack {
                            Image(systemName: theme.icon).font(.largeTitle)
                            //Text(theme.icon).font(.largeTitle)
                            Text(theme.title).font(.subheadline)
                        }
                    }).padding(.horizontal)
                }
            }.padding(.horizontal)
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
        //        ContentView()
        //            .preferredColorScheme(.dark)
        //            .previewInterfaceOrientation(.landscapeLeft)
    }
}
