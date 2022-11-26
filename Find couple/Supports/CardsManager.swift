//
//  CardsClass.swift
//  Find couple
//
//  Created by Buba on 07.06.2022.
//

import UIKit

class CardsManager {
    var cards: [Card] = []
    private var indexOfOneAndOnlyFaceUpCard: Int?
    private var cardsName = [
        "Chiken",
        "Parrot",
        "Sheep",
        "Flamingo",
        "Shark",
        "Giraffe"
    ]
    private var cardsDictionary: [Int:String] = [:]
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].matched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].matched = true
                    cards[index].matched = true
                }
                cards[index].faceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].faceUp = false
                }
                cards[index].faceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func updateViewFromModel(with button: [UIButton]) {
        for index in button.indices {
            let button = button[index]
            let card = cards[index]
            if card.faceUp {
                button.setImage(UIImage(named: getImage(for: card)), for: .normal)
            } else {
                card.matched ? button.setImage(UIImage(named: "Skin2"), for: .normal) : button.setImage(UIImage(named: "Skin"), for: .normal)
            }
        }
    }
    
    func getImage(for card: Card) -> String {
        if cardsDictionary[card.id] == nil, cardsName.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(cardsName.count)))
            cardsDictionary[card.id] = cardsName.remove(at: randomIndex)
        }
        return cardsDictionary[card.id]!
    }
    
    func presentWinLabel(with score: Int, from view: UIViewController) {
        var matchedArray = [Bool]()
        for i in cards.indices {
            let matched = cards[i].matched
            matchedArray.append(matched)
        }
        if matchedArray.contains(false) {
            return
        } else {
            let alert = UIAlertController(
                title: "Win!",
                message: "Your score: \(score)",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                view.dismiss(animated: true)
            }
            
            alert.addAction(okAction)
            view.present(alert, animated: true)
        }
    }
}
