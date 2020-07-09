//
//  Round.swift
//  fast jack
//
//  Created by Daee Kang on 7/8/20.
//  Copyright © 2020 Daee Kang. All rights reserved.
//

import Foundation

class Round {
    private var cards: [String] = []
    private var playerCards: [String] = []
    private var dealerCards: [String] = []
    
    private let DEALER_LIMIT = 16
    
    init() {
        generateCards()
    }
    
    func startGame() {
        dealerCards.append(pullCard())
        dealerCards.append(pullCard())
        playerCards.append(pullCard())
        playerCards.append(pullCard())
    }
    
    func pullCard() -> String {
        if let pulledCard = cards.popLast() {
            return pulledCard
        } else {
            generateCards()
            return cards.popLast()!
        }
    }
    
    func getPlayerCards() -> [String] {
        return playerCards
    }
    
    func getDealerCards() -> [String] {
        return dealerCards
    }
    
    func hit() {
        playerCards.append(pullCard())
    }
    
    func dealerPull() {
        dealerCards.append(pullCard())
    }
    
    //-------- evaluation
    func getCardValue(_ cardArray: [String]) -> Int {
        var count = 0
        var aCount = 0
        
        for card in cardArray {
            if(card == "A") {
                aCount += 1
            }
        }
        
        for _ in 1...aCount {
            var tempCount = 0
            var tempACount = aCount
            
            for card in cardArray {
                switch card {
                    case "A":
                        if(tempACount > 0) {
                            tempCount += 1
                        } else {
                            tempCount += 11
                        }
                        break
                    case "2": fallthrough
                    case "3": fallthrough
                    case "4": fallthrough
                    case "5": fallthrough
                    case "6": fallthrough
                    case "7": fallthrough
                    case "8": fallthrough
                    case "9": fallthrough
                    case "10":
                        tempCount += Int(card)!
                        break
                    case "J": fallthrough
                    case "Q": fallthrough
                    case "K":
                        tempCount += 10
                        break
                    default:
                        //should not be here dawg
                        break
                }
            }
            
            if(tempCount > 21 && aCount != 0) {
                break;
            }
            
            count = tempCount
            aCount -= 1
        }
        
        return count
    }
    
    //while hitting, early exit if over or 21
    func evaluatePlayer() -> Bool {
        if(getCardValue(playerCards) < 21){
            return true
        }
        return false
    }
    
    func evaluateDealer() -> Bool {
        if(getCardValue(dealerCards) < DEALER_LIMIT) {
            return true
        }
        
        return false
    }
    
    //evaluate game
    func evaluateGame() {
        
    }
    
    private func generateCards() {
        for _ in 1...4 { //add cards 4 times
            cards.append("A")
            cards.append("1")
            cards.append("2")
            cards.append("3")
            cards.append("4")
            cards.append("5")
            cards.append("6")
            cards.append("7")
            cards.append("8")
            cards.append("9")
            cards.append("10")
            cards.append("J")
            cards.append("Q")
            cards.append("K")
        }
        cards.shuffle()
    }
}
