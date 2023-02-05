//
//  StartViewController.swift
//  Find couple
//
//  Created by Buba on 04.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons.forEach { button in
            button.animation()
        }
    }
}
