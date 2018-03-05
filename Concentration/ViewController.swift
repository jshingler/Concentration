//
//  ViewController.swift
//  Concentration
//
//  Created by James Shingler on 1/20/18.
//  Copyright © 2018 James Shingler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // MARK: Handle Card Touch Behavior
    
    @IBAction func touchCard(_ sender: UIButton) {
//        flipCount += 1
//        let cardNumber = cardButtons.index(of: sender)!
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle( "", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
    }
    
    var emojiChoicesStatic = ["🦇","😱","🙀","😈","🎃","👻","🍭", "🍬","🍎"]
    
    lazy var emojiChoices = emojiChoicesStatic
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        if emoji[card.identifier] == nil , emojiChoices.count > 0  {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emoji[card.identifier] ?? "?"
    }
    

    @IBAction func startNewGame(_ sender: UIButton) {
        print("START NEW GAME")
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emojiChoices = emojiChoicesStatic
        updateViewFromModel()
    }
}

