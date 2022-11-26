//
//  MidleGameViewController.swift
//  Find couple
//
//  Created by Buba on 28.05.2022.
//

import UIKit

final class MidleGameViewController: UIViewController {
    
    @IBOutlet var cardsButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    private lazy var game = CardsManager(
        numberOfPairsOfCards: (cardsButtons.count + 1) / 2
    )
    
    private var score = 0 {
        didSet {
            scoreLabel.text = "SCORE: \(score)"
        }
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        score += 1
        let cardNumber = cardsButtons.firstIndex(of: sender) ?? 0
        game.chooseCard(at: cardNumber)
        game.updateViewFromModel(with: cardsButtons)
        game.presentWinLabel(with: score, from: self)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
