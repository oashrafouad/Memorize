//
//  ContentView.swift
//  Memorize
//
//  Created by Omar Ashraf on 11/01/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .font(.largeTitle)
    }
    
    var cardRemover: some View {
        Button(action: {
            withAnimation(.bouncy) {
                if cardCount > 1 {
                    cardCount -= 1
                }
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            withAnimation(.bouncy) {
                if cardCount < emojis.count {
                    cardCount += 1
                }
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                // The first rectangle is for providing a white background in dark mode
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            else {
                base.fill()
            }
        }
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
