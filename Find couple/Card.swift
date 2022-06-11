//
//  Card.swift
//  Find couple
//
//  Created by Buba on 07.06.2022.
//

import Foundation

struct Card {
    
    var faceUp = false
    var matched = false
    var id: Int
    
    static var idFactory = 0
    
    static func getId () -> Int {
        
        idFactory += 1
        return idFactory
    }
    
    init () {
        self.id = Card.getId()
    }
}
