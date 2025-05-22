//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anh Dang on 5/22/25.
//
// view model: connects the model and the view
import SwiftUI

// ObservableObject
class EmojiMemoryGame: ObservableObject {
    // order of compile is random
    // static makes the compiler compiles this first
    private static let emojis = ["🦄", "🐇", "🐰", "🦎", "🐻", "🐼", "🦁", "🐨", "🦉", "🐵", "🐿️", "🦅"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return EmojiMemoryGame.emojis[pairIndex]
            } else {
                return "?"
            }
            
        }
    }
    
    // var will change or cause something change
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
