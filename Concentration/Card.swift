//
//  Card.swift
//  Concentration
//
//  Created by James Shingler on 3/4/18.
//  Copyright © 2018 James Shingler. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUinqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUinqueIdentifier()
    }
    
}
