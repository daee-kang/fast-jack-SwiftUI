//
//  BlackJack.swift
//  fast jack
//
//  Created by Daee Kang on 7/8/20.
//  Copyright © 2020 Daee Kang. All rights reserved.
//

import Foundation

class BlackJack: ObservableObject {
    @Published var playerCards: [String]
    @Published var dealerCards: [String]
    
    var round = Round();
    
    init() {
        round.startGame()
        playerCards = round.getPlayerCards()
        dealerCards = round.getDealerCards()
    }
    
    func hit() {
        round.hit()
        playerCards = round.getPlayerCards()
    }
    
    func stay() {
    
    }
}
