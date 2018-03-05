//
//  Concentration.swift
//  Concentration
//
//  Created by James Shingler on 3/4/18.
//  Copyright © 2018 James Shingler. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if Cards Match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            // the Matching Card, ... Creates Copy of Struct
            cards.append(card)
            // OR
            // cards += [card, card]
            
            // TODO: Shuffle the cards
            // HOME WORK
            for _ in cards.indices {
                cards.sort { (_,_) in arc4random() < arc4random() }
            }
        }
       
    }
}

