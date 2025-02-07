//
//  ContentView.swift
//  Memorize
//
//  Created by Omar Ashraf on 11/01/2025.
//

import SwiftUI

struct ContentView: View {
    var viewModel = EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            // The first rectangle is for providing a white background in dark mode
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .aspectRatio(2/3, contentMode: .fit)
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
    }
}
#Preview {
    ContentView()
}
