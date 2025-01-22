//
//  ContentView.swift
//  Memorize
//
//  Created by Omar Ashraf on 11/01/2025.
//

import SwiftUI

//struct Emoji: Identifiable {
//    let id = UUID()
//    let emojiName: String
//}

struct ContentView: View {
    var body: some View {
        let emojis: [String] = ["👻", "🎃", "🕷️", "😈"]
//        let emojis2: [Emoji] = [
//            Emoji(emojiName: "👻"),
//            Emoji(emojiName: "🎃"),
//            Emoji(emojiName: "🕷️"),
//            Emoji(emojiName: "😈")
//        ]
        
        HStack {
//            ForEach(0..<4) { index in
//                CardView(content: emojis[index])
//            }
            
            ForEach(0..<emojis.count, id: \.self) { index in
                
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
        .padding()
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
