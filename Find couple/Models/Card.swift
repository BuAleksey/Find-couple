//
//  Card.swift
//  Find couple
//
//  Created by Buba on 07.06.2022.
//

import Foundation

struct Card {
    static var idFactory = 0
    
    var faceUp = false
    var matched = false
    var id: Int
    
    init () {
        self.id = Card.getId()
    }
    
    static func getId () -> Int {
        idFactory += 1
        return idFactory
    }
}
