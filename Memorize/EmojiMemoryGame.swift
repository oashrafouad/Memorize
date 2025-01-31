// View Model

import SwiftUI

class EmojiMemoryGame {
    var model: MemoryGame<String>
    
    init(model: MemoryGame<String>) {
        self.model = model
    }
}
