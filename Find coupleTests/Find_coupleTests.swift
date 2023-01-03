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
        sut = CardsManager(numberOfPairsOfCards: 4)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testChooseCardIndexOfOneAndOnlyFaceUpCardEqual5() {
        sut.chooseCard(at: 5)
        XCTAssertEqual(sut.indexOfOneAndOnlyFaceUpCard, 5)
     }
}
