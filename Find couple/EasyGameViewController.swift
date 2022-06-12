//
//  EasyGameViewController.swift
//  Find couple
//
//  Created by Buba on 28.05.2022.
//

import UIKit

class EasyGameViewController: UIViewController {
    
    @IBOutlet var cardsButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    lazy var game = CardsClass(numberOfPairsOfCards: (cardsButtons.count + 1) / 2)
    
    var cards = ["Chiken", "Parrot", "Sheep", "Flamingo", "Shark", "Giraffe"]
    var cardsDictionary = [Int:String]()
    
    var score = 0 {
        didSet {
            scoreLabel.text = "SCORE: \(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        score += 1
        let cardNumber = cardsButtons.firstIndex(of: sender) ?? 0
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
        presentWinLabel()
    }
    
    func updateViewFromModel() {
        for index in cardsButtons.indices {
            let button = cardsButtons[index]
            let card = game.cards[index]
            if card.faceUp {
                button.setImage(UIImage(named: image(for: card)), for: .normal)
            } else {
                card.matched ? button.setImage(UIImage(named: "Skin2"), for: .normal) : button.setImage(UIImage(named: "Skin"), for: .normal)
            }
        }
    }
    
    func image(for card: Card) -> String {
        if cardsDictionary[card.id] == nil, cards.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cardsDictionary[card.id] = cards.remove(at: randomIndex)
        }
        return cardsDictionary[card.id]!
    }
    
    func presentWinLabel() {
        var matchedArray = [Bool]()
        for i in game.cards.indices {
            let matched = game.cards[i].matched
            matchedArray.append(matched)
        }
        if matchedArray.contains(false) {
            return
        } else {
            let aler = UIAlertController(title: "WIN!!!", message: "Твой счет: \(score)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            aler.addAction(okAction)
            present(aler, animated: true)
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

