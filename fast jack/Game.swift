//
//  Game.swift
//  fast jack
//
//  Created by Daee Kang on 7/8/20.
//  Copyright © 2020 Daee Kang. All rights reserved.
//

import SwiftUI

struct Game: View {
    @ObservedObject var blackjack = BlackJack();
    
    var body: some View {
        VStack{
            HStack {
                ForEach(0..<blackjack.dealerCards.count, id: \.self) {i in
                    Text(self.blackjack.dealerCards[i])
                }
            }
            HStack {
                ForEach(0..<blackjack.playerCards.count, id: \.self) {i in
                    Text(self.blackjack.playerCards[i])
                }
            }
            HStack {
                Button(action: {
                    self.blackjack.stay()
                }){
                    Text("Stay")
                }
                Button(action: {
                    self.blackjack.hit()
                }){
                    Text("Hit")
                }
            }
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
