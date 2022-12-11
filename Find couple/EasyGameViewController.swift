//
//  EasyGameViewController.swift
//  Find couple
//
//  Created by Buba on 28.05.2022.
//

import UIKit

final class EasyGameViewController: UIViewController {
    
    @IBOutlet var cardsButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var lastScoreLabel: UILabel!
    
    private lazy var game = CardsManager(
        numberOfPairsOfCards: (cardsButtons.count + 1) / 2
    )
    
    private var score = 0 {
        didSet {
            scoreLabel.pulsate()
            scoreLabel.text = "SCORE: \(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLastScoreLabel()
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        score += 1
        let cardNumber = cardsButtons.firstIndex(of: sender) ?? 0
        game.chooseCard(at: cardNumber)
        game.updateViewFromModel(with: cardsButtons)
        game.presentWinLabel(with: score, from: self, key: "Easy")
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension EasyGameViewController {
    private func setupLastScoreLabel() {
        let value = UserDefaults.standard.integer(forKey: "Easy")
        if value != 0 {
            lastScoreLabel.isHidden = false
            lastScoreLabel.text = "Your last result: \(value)"
        }
    }
}

