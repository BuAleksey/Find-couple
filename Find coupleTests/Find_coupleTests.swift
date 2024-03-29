//
//  Find_coupleTests.swift
//  Find coupleTests
//
//  Created by Buba on 03.01.2023.
//

import XCTest
@testable import Find_couple

final class Find_coupleTests: XCTestCase {
    var sut: CardsManager!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testChooseCardIndexOfOneAndOnlyFaceUpCardEqual5() {
        sut = CardsManager(numberOfPairsOfCards: 4)
        sut.chooseCard(at: 5)
        XCTAssertEqual(sut.indexOfOneAndOnlyFaceUpCard, 5)
     }
    
    func testChooseCardIsFaceUp() {
        sut = CardsManager(numberOfPairsOfCards: 1)
        sut.chooseCard(at: 1)
        XCTAssertTrue(sut.cards[1].faceUp)
     }
}
