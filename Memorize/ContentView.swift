//
//  ContentView.swift
//  Memorize
//
//  Created by Trubchanin Andriy on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
            .padding(.horizontal)
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
            Text("Hello, Paul!!")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
