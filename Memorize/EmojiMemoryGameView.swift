//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Anh Dang on 5/3/25.
//


import SwiftUI


struct EmojiMemoryGameView: View {
    // ObservedObject : if something change redraw me
    // has to be a type of Observable Object
    @ObservedObject var viewModel : EmojiMemoryGame
        
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Button("Shuffled") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0)
        {
            ForEach(viewModel.cards.indices, id : \.self){index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView : View {
    let card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(Color.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}









struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
