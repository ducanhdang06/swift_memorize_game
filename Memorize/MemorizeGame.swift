//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anh Dang on 5/10/25.
//
// model
import Foundation

struct MemoryGame <CardContent> {
    
    // the only struct that can make changes to this cards is this struct
    // but it allows others to see (not set)
    private(set) var cards: Array<Card>
    
    // initializer
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add number of pairs of cards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content : CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    // any function that is changing the model has to mark mutating
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    func choose(_ card: Card){
        
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent // dont care types (it can be anything)
    }
}
